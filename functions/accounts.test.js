const functionsTest = require("firebase-functions-test")();
const logger = require("firebase-functions/logger");
const auth = require("firebase-admin/auth");
const {
  createUser,
  updateUser,
} = require("./accounts");

jest.mock("firebase-functions/logger");
jest.mock("firebase-admin/auth");

afterEach(() => {
  jest.clearAllMocks();
});

describe("createUser()", () => {
  it("creates auth user with properties of given doc" +
  "and generated password.", async () => {
    // Prepare
    const uid = "user01";
    const email = "user@example.com";
    const displayName = "User 01";
    const userProps = {email, displayName};
    const mockDocAccount = functionsTest.firestore
        .makeDocumentSnapshot(userProps, `accounts/${uid}`);
    auth.createUser = jest.fn(() => Promise.resolve({}));
    logger.info = jest.fn();

    // Run
    await createUser(auth, mockDocAccount);

    // Evaluate
    expect(auth.createUser.mock.calls).toEqual([
      [
        {uid, password: expect.any(String), ...userProps},
      ],
    ]);
    expect(logger.info.mock.calls).toEqual([
      [`create user: ${uid} with email ${email}`],
    ]);
  });

  it("don't create auth user without email.", async () => {
    // Prepare
    const uid = "user01";
    const userProps = {
      displayName: "User 01",
    };
    const mockDocAccount = functionsTest.firestore
        .makeDocumentSnapshot(userProps, `accounts/${uid}`);
    auth.createUser = jest.fn(() => Promise.resolve({}));
    logger.error = jest.fn();

    // Run
    await createUser(auth, mockDocAccount);

    // Evaluate
    expect(auth.createUser.mock.calls).toEqual([
    ]);
    expect(logger.error.mock.calls).toEqual([
      [`empty email: ${uid}`],
    ]);
  });
});

describe("updateUser()", () => {
  it("updates auth user with properties of given doc", async () => {
    // Prepare
    const uid = "user01";
    const userPropsBefore = {
      email: "user@example.com",
      displayName: "User 01",
      disabled: false,
      photoURL: "https://example.com/photos/1",
      dummy: "old value",
    };
    const userPropsAfter = {
      email: "user@example.com",
      displayName: "User 01",
      disabled: true,
      dummy: "new value",
    };
    const mockChange = functionsTest.makeChange(
        functionsTest.firestore
            .makeDocumentSnapshot(userPropsBefore, `accounts/${uid}`),
        functionsTest.firestore
            .makeDocumentSnapshot(userPropsAfter, `accounts/${uid}`),
    );
    auth.updateUser = jest.fn(() => Promise.resolve({}));
    logger.info = jest.fn();

    // Run
    await updateUser(auth, mockChange);

    // Evaluate
    expect(auth.updateUser.mock.calls).toEqual([
      [uid, {disabled: true}],
    ]);
    expect(logger.info.mock.calls).toEqual([
      [`update user: ${uid} with props ${JSON.stringify({disabled: true})}`],
    ]);
  });

  it("don't update auth user without changes.", async () => {
    // Prepare
    const uid = "user01";
    const userPropsBefore = {
      email: "user@example.com",
      displayName: "User 01",
      disabled: true,
      photoURL: "https://example.com/photos/1",
      dummy: "old value",
    };
    const userPropsAfter = {
      email: "user@example.com",
      displayName: "User 01",
      disabled: true,
      dummy: "new value",
    };
    const mockChange = functionsTest.makeChange(
        functionsTest.firestore
            .makeDocumentSnapshot(userPropsBefore, `accounts/${uid}`),
        functionsTest.firestore
            .makeDocumentSnapshot(userPropsAfter, `accounts/${uid}`),
    );
    auth.updateUser = jest.fn(() => Promise.resolve({}));
    logger.warn = jest.fn();

    // Run
    await updateUser(auth, mockChange);

    // Evaluate
    expect(auth.updateUser.mock.calls).toEqual([
    ]);
    expect(logger.warn.mock.calls).toEqual([
      [`skip update user: ${uid}`],
    ]);
  });
});


