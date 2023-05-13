const {
  onDocumentDeleted,
} = require("firebase-functions/v2/firestore");
const logger = require("firebase-functions/logger");
const {initializeApp} = require("firebase-admin/app");
const {getFirestore} = require("firebase-admin/firestore");
const axios = require("axios");

const REGION = "asia-northeast1";

initializeApp();
const versionRef = getFirestore().collection("service").doc("version");

exports.region(REGION).onDeletedVersion = onDocumentDeleted(
    versionRef.path,
    async (event) => {
      const url = `https://${event.project}.web.app/version.jsonx`;
      const params = `check=${new Date().getTime()}`;
      const res = await axios.get(`${url}?${params}`);
      const {version} = res.data;
      logger.info(`create doc ${versionRef.path}: ${version}`);
      await versionRef.set({version});
    },
);
