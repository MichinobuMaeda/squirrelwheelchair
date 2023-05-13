const {
  onDocumentDeleted,
} = require("firebase-functions/v2/firestore");
const {setGlobalOptions} = require("firebase-functions/v2");
const logger = require("firebase-functions/logger");
const {initializeApp} = require("firebase-admin/app");
const axios = require("axios");

setGlobalOptions({region: "asia-northeast1"});

initializeApp();

exports.onDeletedVersion = onDocumentDeleted(
    "service/version",
    async (event) => {
      const oldVersion = event.data.before.data().version;
      const verRef = event.data.before.ref;
      logger.info(`deleted doc ${event.data.before.ref.path}: ${oldVersion}`);

      try {
        // TODO: upgrade()

        const url = `https://${event.project}.web.app/version.json`;
        const params = `check=${new Date().getTime()}`;
        const res = await axios.get(`${url}?${params}`);
        const {version} = res.data;
        logger.info(`get new version: ${version}`);

        await verRef.set({version});
        logger.info(`created doc ${verRef.path}: ${version}`);
      } catch (e) {
        try {
          logger.error(e.toString());
          logger.error(e.stack);
          await verRef.ref.set({version: oldVersion});
          logger.error(`restored doc ${verRef.path}: ${oldVersion}`);
        } catch (e) {
          logger.error(`failed to restore doc ${verRef.path}: ${oldVersion}`);
          logger.error(e.toString());
          logger.error(e.stack);
        }
      }
    },
);
