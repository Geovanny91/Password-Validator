# 🔐 Password Validator Smart Contract

> A **Solidity Smart Contract** designed to validate passwords under specific security rules directly on the blockchain.  
> It provides a decentralized and transparent way to ensure passwords meet minimum security criteria before being accepted or registered.

---

## 🧩 Description

This smart contract validates passwords according to the following security criteria:

- ✅ Must include **at least one uppercase letter**.
- ✅ Must include **at least one lowercase letter**.
- ✅ Must include **at least one numeric digit (0–9)**.
- ✅ Must include **at least one special character** from the following list: `@!_$%#`
- ✅ Must have a **minimum length of 10 characters**.

The contract emits an event when the password successfully passes all validation checks.

---

## ⚙️ Smart Contract Details

### 🛡️ Modifiers

| Name | Parameters | Description |
|------|------------|--------------|
| `isPasswordEmpty(string memory password_)` | `password_` | Checks that the password is not empty before executing validation. |

---

### 📢 Events

| Name | Parameters | Description |
|------|-------------|--------------|
| `eventValidatePassword` | `string password_`, `string result_` | Emitted when a password has been successfully validated. |

---

### 🧠 Functions

| Name | Parameter(s) | Returns | Description |
|------|---------------|----------|--------------|
| `haveMinimunLenght(string memory password_)` | `password_` | `bool` | Returns `true` if the password has at least 10 characters. |
| `hasLowerCaseLetter(string memory password_)` | `password_` | `bool` | Checks if it contains at least one lowercase letter. |
| `hasUpperCaseLetter(string memory password_)` | `password_` | `bool` | Checks if it contains at least one uppercase letter. |
| `hasNumber(string memory password_)` | `password_` | `bool` | Checks if it contains at least one number. |
| `hasSpecialCharacter(string memory password_)` | `password_` | `bool` | Checks if it contains at least one special character (`@!_$%#`). |

---

## 🚀 How to Use the Contract

### 1️⃣ Deploying the Contract

1. Open **[Remix IDE](https://remix.ethereum.org/)**.  
2. Create a new file named **`PasswordValidator.sol`** and paste the contract code.  
3. Navigate to the **Solidity Compiler** tab:  
   - Select the compiler version **0.8.28**  
   - Click ✅ **Compile `PasswordValidator.sol`**  
4. Go to the **🛠️ Deploy & Run Transactions** tab:  
   - Select **Environment** as **Remix VM (Cancun)** for local testing.  
   - Click 🚀 **Deploy** to deploy the contract.  

---

## 📜 License

This project is licensed under the **LGPL-3.0-only**.  

---

## 💡 Author

**Developed by [Geovanny Rios](https://github.com/Geovanny91)** 🧠  
💼 *Blockchain & Smart Contract Developer*  
🔗 [GitHub Profile](https://github.com/Geovanny91)