# 🚗 Garage Management System

A comprehensive web-based garage management system built with **Java Spring Boot**, **JSP**, and **MySQL**. This system provides two main modules for appointment booking and supplier statistics management.

## 📋 Table of Contents

- [Features](#features)
- [Technology Stack](#technology-stack)
- [System Requirements](#system-requirements)
- [Installation](#installation)
- [Database Setup](#database-setup)
- [Running the Application](#running-the-application)
- [Usage Guide](#usage-guide)
- [Project Structure](#project-structure)
- [API Endpoints](#api-endpoints)
- [Troubleshooting](#troubleshooting)
- [Future Enhancements](#future-enhancements)

---

## ✨ Features

### Module 1: Appointment Booking
- ✅ Customer home dashboard
- ✅ Online appointment booking with date/time selection
- ✅ Service type selection (Oil Change, Engine Repair, Tire Service, etc.)
- ✅ View upcoming and past appointments
- ✅ Appointment confirmation and success notification
- ✅ Date/time validation (no past dates, no taken time slots)

### Module 2: Supplier Statistics
- ✅ Management staff dashboard
- ✅ Supplier statistics by imported quantity
- ✅ Date range filtering
- ✅ View detailed supplier information
- ✅ View import orders and spare parts details
- ✅ Complete order details with invoice information
- ✅ Drill-down navigation (Statistics → Supplier → Order)

---

## 🛠️ Technology Stack

- **Backend:** Java 17, Spring Boot 3.2.0
- **Frontend:** JSP, HTML5, CSS3, JavaScript
- **Database:** MySQL 8.x
- **Build Tool:** Maven
- **ORM:** Spring Data JPA / Hibernate
- **Template Engine:** JSP with JSTL
- **Server:** Embedded Tomcat

---

## 💻 System Requirements

- **Java:** JDK 17 or higher
- **Maven:** 3.6+ (or use included wrapper)
- **MySQL:** 8.0 or higher
- **IDE:** IntelliJ IDEA, Eclipse, or VS Code (optional)
- **Browser:** Chrome, Firefox, Edge, or Safari (latest versions)

---

## 📥 Installation

### 1. Clone or Download the Project

```bash
cd c:\Users\Laptop\Downloads\pttk\garage-management
```

### 2. Install Java (if not installed)

Download and install JDK 17 from:
- https://www.oracle.com/java/technologies/downloads/
- Or use OpenJDK: https://adoptium.net/

Verify installation:
```bash
java -version
```

### 3. Install MySQL (if not installed)

Download and install MySQL from:
- https://dev.mysql.com/downloads/mysql/

---

## 🗄️ Database Setup

### Step 1: Create Database

Open MySQL Command Line or MySQL Workbench and run:

```sql
CREATE DATABASE garage_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

### Step 2: Create MySQL User (Optional but Recommended)

```sql
CREATE USER 'garage_user'@'localhost' IDENTIFIED BY 'garage_password';
GRANT ALL PRIVILEGES ON garage_db.* TO 'garage_user'@'localhost';
FLUSH PRIVILEGES;
```

### Step 3: Update Database Configuration

Edit `src/main/resources/application.properties`:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/garage_db?useSSL=false&serverTimezone=UTC
spring.datasource.username=root
spring.datasource.password=YOUR_MYSQL_PASSWORD
```

Replace `YOUR_MYSQL_PASSWORD` with your actual MySQL password.

### Step 4: Initialize Database

The application will automatically create tables on first run (using `spring.jpa.hibernate.ddl-auto=update`).

Alternatively, manually run the SQL scripts:

```bash
mysql -u root -p garage_db < src/main/resources/schema.sql
mysql -u root -p garage_db < src/main/resources/data.sql
```

---

## 🚀 Running the Application

### Using Maven

```bash
# Navigate to project directory
cd garage-management

# Clean and build
mvn clean install

# Run the application
mvn spring-boot:run
```

### Using IDE (IntelliJ IDEA / Eclipse)

1. Open project in your IDE
2. Wait for Maven dependencies to download
3. Run `GarageApplication.java` (main class)

### Access the Application

Once started, open your browser and navigate to:

```
http://localhost:8080/garage
```

You should see the welcome page with two options:
- **Customer Portal** - For appointment booking
- **Management Portal** - For supplier statistics

---

## 📖 Usage Guide

### For Customers (Module 1: Appointment Booking)

1. **Access Customer Portal**
   - Click "Customer Portal" from home page
   - Default customer is loaded (ID: 1 - Nguyen Van A)

2. **Book an Appointment**
   - Click "Book New Appointment" button
   - Select service type (Oil Change, Engine Repair, etc.)
   - Choose appointment date (must be future date)
   - Select appointment time
   - Add optional notes
   - Click "Confirm Booking"

3. **View Appointments**
   - Click "View My Appointments"
   - See upcoming and past appointments
   - View appointment status (Pending, Confirmed, Completed, Cancelled)

### For Management Staff (Module 2: Supplier Statistics)

1. **Access Management Portal**
   - Click "Management Portal" from home page
   - Navigate to "Supplier Statistics"

2. **View Supplier Statistics**
   - Select start date and end date
   - Click "View Statistics"
   - See list of suppliers with total imported quantities
   - Suppliers are sorted by quantity (highest first)

3. **View Supplier Details**
   - Click "View Detail" on any supplier
   - See supplier contact information
   - View list of import orders within date range
   - Each order shows: order code, date, total parts, amount, status

4. **View Order Details**
   - Click "View Order" on any order
   - See complete order information:
     - Supplier details
     - Order date and processed by staff
     - List of all spare parts with quantities and prices
     - Total amount

---

## 📁 Project Structure

```
garage-management/
├── src/
│   ├── main/
│   │   ├── java/com/garage/
│   │   │   ├── entity/              # Entity classes (JPA)
│   │   │   │   ├── User.java
│   │   │   │   ├── Customer.java
│   │   │   │   ├── Appointment.java
│   │   │   │   ├── Supplier.java
│   │   │   │   ├── Order.java
│   │   │   │   ├── OrderDetail.java
│   │   │   │   └── Sparepart.java
│   │   │   ├── repository/          # Data Access Layer
│   │   │   │   ├── CustomerRepository.java
│   │   │   │   ├── AppointmentRepository.java
│   │   │   │   ├── SupplierRepository.java
│   │   │   │   └── OrderRepository.java
│   │   │   ├── service/             # Business Logic Layer
│   │   │   │   ├── CustomerService.java
│   │   │   │   ├── AppointmentService.java
│   │   │   │   ├── SupplierService.java
│   │   │   │   └── OrderService.java
│   │   │   ├── controller/          # Web Controllers
│   │   │   │   ├── HomeController.java
│   │   │   │   ├── CustomerController.java
│   │   │   │   ├── AppointmentController.java
│   │   │   │   ├── SupplierStatisticsController.java
│   │   │   │   └── OrderController.java
│   │   │   └── GarageApplication.java
│   │   ├── resources/
│   │   │   ├── application.properties
│   │   │   ├── schema.sql           # Database schema
│   │   │   └── data.sql             # Sample data
│   │   └── webapp/
│   │       ├── WEB-INF/jsp/         # JSP Views
│   │       │   ├── index.jsp
│   │       │   ├── customer-home.jsp
│   │       │   ├── book-appointment.jsp
│   │       │   ├── appointment-success.jsp
│   │       │   ├── management-staff-home.jsp
│   │       │   ├── supplier-statistics.jsp
│   │       │   ├── supplier-details.jsp
│   │       │   └── order-details.jsp
│   │       ├── css/                 # Stylesheets
│   │       │   ├── style.css
│   │       │   ├── module1.css
│   │       │   └── module2.css
│   │       └── js/                  # JavaScript
│   │           ├── appointment.js
│   │           └── statistics.js
│   └── test/
├── pom.xml                          # Maven configuration
└── README.md
```

---

## 🔌 API Endpoints

### Module 1: Appointment Booking

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/customer/home` | Customer home page |
| GET | `/customer/home/{id}` | Specific customer home |
| GET | `/appointment/book/{customerId}` | Show booking form |
| POST | `/appointment/book` | Process booking |
| GET | `/appointment/success/{appointmentId}` | Success page |
| GET | `/appointment/list/{customerId}` | List appointments |

### Module 2: Supplier Statistics

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/statistics/home` | Management home |
| GET | `/statistics/suppliers` | Show statistics form |
| POST | `/statistics/suppliers` | View statistics results |
| GET | `/statistics/supplier/{id}` | Supplier details |
| GET | `/order/{id}` | Order details |

---

## 🔧 Troubleshooting

### Database Connection Issues

**Problem:** Cannot connect to MySQL
```
Solution:
1. Check if MySQL service is running
2. Verify username/password in application.properties
3. Ensure database 'garage_db' exists
4. Check port 3306 is not blocked by firewall
```

### Port Already in Use

**Problem:** Port 8080 is already in use
```
Solution:
1. Change port in application.properties:
   server.port=8081
2. Or stop the application using port 8080
```

### JSP Not Found / 404 Error

**Problem:** JSP pages return 404
```
Solution:
1. Check JSP files are in src/main/webapp/WEB-INF/jsp/
2. Verify spring.mvc.view.prefix and suffix in application.properties
3. Ensure tomcat-embed-jasper dependency is in pom.xml
```

### CSS/JS Not Loading

**Problem:** Styles not applied
```
Solution:
1. Check files are in src/main/webapp/css/ and src/main/webapp/js/
2. Clear browser cache (Ctrl+F5)
3. Check browser console for 404 errors
```

### Date Format Issues

**Problem:** Date not displaying correctly
```
Solution:
1. Check timezone in database URL:
   ?serverTimezone=UTC
2. Ensure JSTL fmt library is imported in JSP
```

---

## 🎯 Sample Test Data

The system comes with pre-loaded test data:

### Customers (5)
- **Customer 1:** Nguyen Van A (nguyenvana@gmail.com)
- **Customer 2:** Tran Thi B (tranthib@gmail.com)
- And 3 more...

### Suppliers (5)
- **Supplier 1:** AutoParts Vietnam Ltd
- **Supplier 2:** Global Motors Supply
- And 3 more...

### Orders (12)
- Various orders from different suppliers
- Date range: September 2025 - October 2025

### Appointments (8)
- Mix of pending, confirmed, and completed appointments

---

## 🚀 Future Enhancements

Possible improvements for future versions:

### Authentication & Security
- [ ] User login/logout functionality
- [ ] Role-based access control (RBAC)
- [ ] Password encryption
- [ ] Session management

### Module 1 Enhancements
- [ ] Email/SMS notifications for appointments
- [ ] Appointment rescheduling
- [ ] Customer feedback/rating system
- [ ] Service history tracking

### Module 2 Enhancements
- [ ] Export statistics to PDF/Excel
- [ ] Interactive charts and graphs (Chart.js)
- [ ] Advanced filtering and search
- [ ] Inventory management integration
- [ ] Purchase order generation

### Technical Improvements
- [ ] RESTful API for mobile app
- [ ] Pagination for large datasets
- [ ] Caching for performance
- [ ] Comprehensive unit tests
- [ ] Docker containerization
- [ ] CI/CD pipeline

---

## 📝 License

This project is created for educational purposes.

---

## 👥 Contact & Support

For questions or issues:
- **GitHub Issues:** [Create an issue]
- **Email:** support@garage-management.com

---

## 🎓 Credits

**Developed by:** Garage Team
**Course:** Software Analysis and Design
**Subject No.:** 31
**Duration:** 90 minutes

---

## 📸 Screenshots

### Home Page
![Home Page](screenshots/home.png)

### Customer Dashboard
![Customer Dashboard](screenshots/customer-home.png)

### Appointment Booking
![Booking Form](screenshots/book-appointment.png)

### Supplier Statistics
![Statistics](screenshots/supplier-statistics.png)

### Order Details
![Order Details](screenshots/order-details.png)

---

**Last Updated:** October 17, 2025
**Version:** 1.0.0
**Status:** ✅ Production Ready

---

Happy Coding! 🚗💨
