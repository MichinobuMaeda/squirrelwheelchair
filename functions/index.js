const {setGlobalOptions} = require("firebase-functions/v2");
const {
  onDocumentCreated,
  onDocumentUpdated,
  onDocumentDeleted,
} = require("firebase-functions/v2/firestore");
const {
  beforeUserCreated,
} = require("firebase-functions/v2/identity");
const logger = require("firebase-functions/logger");
const {initializeApp} = require("firebase-admin/app");
const {getFirestore} = require("firebase-admin/firestore");
const {getAuth} = require("firebase-admin/auth");
const {
  restoreTriggerDoc,
  upgradeData,
  setUiVersion,
} = require("./upgrade");
const {
  createUser,
  updateUser,
} = require("./accounts");
const {setTestData} = require("./testUtils");

setGlobalOptions({region: "asia-northeast1"});

initializeApp();

exports.beforeUserCreated = beforeUserCreated(
    (event) => {
      logger.info(JSON.stringify(event.additionalUserInfo));
    },
);

exports.onCreateAccount = onDocumentCreated(
    "accounts/{account}",
    (event) => createUser(getAuth(), event.data),
);

exports.onUpdateAccount = onDocumentUpdated(
    "accounts/{account}",
    (event) => updateUser(getAuth(), event.data),
);

exports.onDeletedUpgrade = onDocumentDeleted(
    "service/upgrade",
    async (event) => {
      const db = getFirestore();
      await restoreTriggerDoc(event);
      await upgradeData(db);
      await setUiVersion(event, db);
    },
);

exports.onDeletedTest = onDocumentDeleted(
    "service/test",
    async (_) => {
      logger.info(process.env.NODE_ENV);
      if (process.env.NODE_ENV !== "test") return;
      await upgradeData(getFirestore());
      await setTestData(getFirestore());
    },
);
