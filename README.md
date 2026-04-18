# 🚀 Smart Sales Discount Approval System (SSDA)

## 📌 Overview
The **Smart Sales Discount Approval System (SSDA)** is a Salesforce-based solution designed to automate and streamline the sales discount approval process. It replaces manual workflows with a structured, rule-based system that ensures accuracy, transparency, and efficiency.

---

## 🎯 Objectives
- Standardize discount approval workflow  
- Prevent invalid discount requests  
- Reduce manual intervention  
- Ensure bulk-safe processing  
- Provide real-time status visibility  
- Maintain audit trail  

---

## 👥 User Roles

| Role | Responsibilities |
|------|----------------|
| Sales Representative | Create Accounts, Contacts, Opportunities, and submit discount requests |
| Sales Manager | Approve/Reject medium-level discounts |
| Regional Manager | Approve high-value discounts |
| System Administrator | Configure thresholds and automation |

---

## ⚙️ Features

### 🧾 Opportunity Management
- Create opportunities with validation (`Amount > 0`)
- Built using Lightning Web Components (LWC) and Apex

### 💸 Discount Request Creation
- Submit discount requests linked to opportunities
- Default status: `Draft`

### 🔍 Discount Validation (Apex Trigger)
- Discount > 40% → Rejected  
- Amount > 100,000 AND Discount > 20% → Rejected  
- Implemented using **bulk-safe trigger handler pattern**

### 🔄 Approval Routing
- ≤ 10% → Auto Approved  
- 10–25% → Sales Manager  
- > 25% → Regional Manager  

### 🔁 Post Approval Automation
- Approved → Opportunity Stage = `Negotiation`  
- Rejected → Opportunity Stage = `Closed Lost`  
- Implemented using **Record-Triggered Flow**

### 🔔 Notifications
- Email notifications sent using **Queueable Apex**
- Approval actions logged for audit tracking  

### 🖥️ User Interface (LWC Components)
- Opportunity Creator  
- Discount Request Form  
- Status Dashboard  

### 🔐 Security
- Role-based access control  
- Field-level security enforced  

---

## 🧠 Technical Highlights
- Bulk-safe Apex Triggers (handles up to 200 records)
- Trigger Handler Pattern (clean and scalable architecture)
- Queueable Apex for asynchronous processing
- Record-Triggered Flows for automation
- 85%+ test coverage
- Meaningful error handling

---

## 🗂️ Data Model

### Standard Objects
- Account  
- Contact  
- Opportunity  

### Custom Objects
- `Discount_Request__c`  
- `Approval_Log__c`  

---

## 🛠️ Tech Stack
- Apex  
- Lightning Web Components (LWC)  
- SOQL  
- Record-Triggered Flow  
- Approval Process  
- Queueable Apex  

---

## 📸 Screenshots
<img width="1920" height="1080" alt="Screenshot (4)" src="https://github.com/user-attachments/assets/a8b2d84a-63cf-41f3-be4f-40b6045c74a6" />
<img width="1920" height="1008" alt="Screenshot 2026-02-14 114131" src="https://github.com/user-attachments/assets/f39fa208-0db1-42f5-beaa-f4834e8b92bc" />
<img width="1920" height="1008" alt="Screenshot 2026-04-18 105613" src="https://github.com/user-attachments/assets/8883f37f-4aed-4937-96d1-28477443674e" />
<img width="1920" height="1080" alt="Screenshot 2026-04-18 110744" src="https://github.com/user-attachments/assets/6418b2fc-582c-4b05-b259-260f3f26c957" />
<img width="1920" height="1008" alt="Screenshot 2026-04-18 110457" src="https://github.com/user-attachments/assets/0f7d2eb5-92d2-4843-851b-3ea64f83a012" />


