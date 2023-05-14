const crypto = require("node:crypto");
const logger = require("firebase-functions/logger");

const userPropNames = [
  // "uid",
  "email",
  "emailVerified",
  "phoneNumber",
  // "password",
  "displayName",
  "photoURL",
  "disabled",
];

/**
 * Create account from doc.
 * @param {object} auth Firebase Authentication.
 * @param {object} doc Account attributes.
 */
async function createUser(auth, doc) {
  const uid = doc.id;
  const password = crypto.randomBytes(20).toString("base64");
  const userProps = {};
  userPropNames.forEach((name) => {
    if (!doc.data()[name]) return;
    userProps[name] = doc.data()[name];
  });

  if (!userProps.email) {
    logger.error(`empty email: ${uid}`);
    return;
  }

  await auth.createUser({uid, password, ...userProps});
  logger.info(`create user: ${uid} with email ${userProps.email}`);
}

/**
 * Create account from doc.
 * @param {object} auth Firebase Authentication.
 * @param {object} change Account attributes.
 */
async function updateUser(auth, change) {
  const uid = change.after.id;
  const userProps = {};
  userPropNames.forEach((name) => {
    if (!change.after.data()[name]) return;
    if (change.before.data()[name] === change.after.data()[name]) return;
    userProps[name] = change.after.data()[name];
  });

  if (!Object.keys(userProps).length) {
    logger.warn(`skip update user: ${uid}`);
    return;
  }

  await auth.updateUser(uid, userProps);
  logger.info(`update user: ${uid} with props ${JSON.stringify(userProps)}`);
}

module.exports = {
  createUser,
  updateUser,
};
