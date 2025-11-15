-- ===============================
-- GARAGE MANAGEMENT SYSTEM
-- Sample Data
-- ===============================

-- Insert Users (password: 123456 for all)
INSERT INTO users (username, password, full_name, email, phone, user_type) VALUES
('customer1', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'Nguyen Van A', 'nguyenvana@gmail.com', '0901234567', 'CUSTOMER'),
('customer2', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'Tran Thi B', 'tranthib@gmail.com', '0901234568', 'CUSTOMER'),
('customer3', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'Le Van C', 'levanc@gmail.com', '0901234569', 'CUSTOMER'),
('customer4', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'Pham Thi D', 'phamthid@gmail.com', '0901234570', 'CUSTOMER'),
('customer5', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'Hoang Van E', 'hoangvane@gmail.com', '0901234571', 'CUSTOMER'),
('warehouse1', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'Do Van F', 'dovanf@garage.com', '0902345678', 'WAREHOUSE_STAFF'),
('warehouse2', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'Vu Thi G', 'vuthig@garage.com', '0902345679', 'WAREHOUSE_STAFF'),
('manager1', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'Bui Van H', 'buivanh@garage.com', '0903456789', 'MANAGEMENT_STAFF'),
('manager2', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'Dang Thi I', 'dangthii@garage.com', '0903456790', 'MANAGEMENT_STAFF');

-- Insert Customers
INSERT INTO customers (user_id, address, date_of_birth, vehicle_info, notes) VALUES
(1, '123 Nguyen Trai, Ha Noi', '1990-05-15', 'Honda City 2020', 'Regular customer'),
(2, '456 Le Loi, TP.HCM', '1985-08-20', 'Toyota Vios 2019', 'Prefers morning appointments'),
(3, '789 Tran Phu, Da Nang', '1992-03-10', 'Mazda 3 2021', NULL),
(4, '321 Hai Ba Trung, Ha Noi', '1988-11-25', 'Hyundai Accent 2018', 'VIP customer'),
(5, '654 Vo Van Tan, TP.HCM', '1995-07-30', 'Kia Morning 2020', 'New customer');

-- Insert Appointments
INSERT INTO appointments (customer_id, appointment_date, appointment_time, service_type, status, notes) VALUES
(1, '2025-10-20', '09:00:00', 'OIL_CHANGE', 'CONFIRMED', 'Regular oil change'),
(1, '2025-09-15', '14:00:00', 'TIRE_CHANGE', 'COMPLETED', 'Changed 4 tires'),
(2, '2025-10-22', '10:30:00', 'ENGINE_REPAIR', 'PENDING', 'Check engine light on'),
(3, '2025-10-25', '15:00:00', 'BRAKE_SERVICE', 'CONFIRMED', 'Brake pads replacement'),
(4, '2025-10-18', '08:30:00', 'GENERAL_CHECKUP', 'CONFIRMED', 'Annual checkup'),
(5, '2025-10-28', '11:00:00', 'OIL_CHANGE', 'PENDING', 'First time customer'),
(2, '2025-08-10', '09:30:00', 'AC_REPAIR', 'COMPLETED', 'AC not cooling'),
(3, '2025-09-20', '13:00:00', 'OIL_CHANGE', 'COMPLETED', NULL);

-- Insert Warehouse Staff
INSERT INTO warehouse_staff (user_id, staff_code, department, hire_date) VALUES
(6, 'WH001', 'Warehouse', '2020-01-15'),
(7, 'WH002', 'Warehouse', '2021-06-01');

-- Insert Management Staff
INSERT INTO management_staff (user_id, staff_code, position, department, hire_date) VALUES
(8, 'MGR001', 'Manager', 'Operations', '2019-03-10'),
(9, 'MGR002', 'Senior Manager', 'Finance', '2018-07-20');

-- Insert Suppliers
INSERT INTO suppliers (supplier_code, supplier_name, contact_person, email, phone, address, city, country) VALUES
('SUP001', 'AutoParts Vietnam Ltd', 'Nguyen Van X', 'contact@autoparts.vn', '0241234567', '45 Giai Phong St', 'Ha Noi', 'Vietnam'),
('SUP002', 'Global Motors Supply', 'Tran Thi Y', 'sales@globalmotors.vn', '0282345678', '78 Nguyen Hue Blvd', 'TP.HCM', 'Vietnam'),
('SUP003', 'Premium Car Parts', 'Le Van Z', 'info@premiumparts.vn', '0236345678', '12 Bach Dang St', 'Da Nang', 'Vietnam'),
('SUP004', 'FastTech Auto', 'Pham Van K', 'support@fasttech.vn', '0243456789', '90 Tran Hung Dao St', 'Ha Noi', 'Vietnam'),
('SUP005', 'Quality Spares Co', 'Hoang Thi L', 'sales@qualityspares.vn', '0284567890', '23 Le Duan St', 'TP.HCM', 'Vietnam');

-- Insert Spare Parts
INSERT INTO spareparts (part_code, part_name, description, category, unit, current_stock, min_stock, unit_price) VALUES
('ENG001', 'Engine Oil 5W-30', 'Synthetic engine oil 5W-30, 4L', 'ENGINE', 'liter', 150, 50, 250000),
('ENG002', 'Oil Filter', 'Standard oil filter', 'ENGINE', 'piece', 200, 50, 85000),
('ENG003', 'Air Filter', 'Air filter for most vehicles', 'ENGINE', 'piece', 180, 40, 120000),
('ENG004', 'Spark Plug', 'Iridium spark plug', 'ENGINE', 'piece', 300, 100, 95000),
('BRK001', 'Brake Pad Set Front', 'Ceramic brake pads front', 'BRAKE', 'set', 80, 20, 450000),
('BRK002', 'Brake Pad Set Rear', 'Ceramic brake pads rear', 'BRAKE', 'set', 75, 20, 380000),
('BRK003', 'Brake Disc Front', 'Ventilated brake disc front', 'BRAKE', 'piece', 50, 15, 650000),
('BRK004', 'Brake Fluid DOT4', 'Brake fluid DOT4, 1L', 'BRAKE', 'liter', 120, 30, 180000),
('TIR001', 'Tire 195/65R15', 'All-season tire 195/65R15', 'TIRE', 'piece', 100, 20, 1200000),
('TIR002', 'Tire 205/55R16', 'All-season tire 205/55R16', 'TIRE', 'piece', 80, 20, 1400000),
('ELE001', 'Car Battery 12V 60Ah', 'Maintenance-free battery', 'ELECTRICAL', 'piece', 45, 10, 1800000),
('ELE002', 'Headlight Bulb H4', 'Halogen headlight bulb', 'ELECTRICAL', 'piece', 200, 50, 65000),
('ELE003', 'Wiper Blade Set', 'Front wiper blades pair', 'BODY', 'set', 90, 30, 250000),
('BOD001', 'Side Mirror Left', 'Side mirror left with signal', 'BODY', 'piece', 30, 10, 850000),
('BOD002', 'Side Mirror Right', 'Side mirror right with signal', 'BODY', 'piece', 30, 10, 850000),
('SUS001', 'Shock Absorber Front', 'Gas shock absorber front', 'SUSPENSION', 'piece', 40, 10, 980000),
('SUS002', 'Shock Absorber Rear', 'Gas shock absorber rear', 'SUSPENSION', 'piece', 40, 10, 920000),
('ACR001', 'AC Compressor', 'Air conditioning compressor', 'AC', 'piece', 15, 5, 4500000),
('ACR002', 'AC Filter', 'Cabin air filter', 'AC', 'piece', 150, 40, 180000),
('FUE001', 'Fuel Filter', 'Fuel filter standard', 'ENGINE', 'piece', 160, 50, 145000);

-- Insert Orders
INSERT INTO orders (order_code, supplier_id, warehouse_staff_id, order_date, total_amount, status) VALUES
('ORD001', 1, 1, '2025-09-01', 15750000, 'RECEIVED'),
('ORD002', 2, 1, '2025-09-05', 8960000, 'RECEIVED'),
('ORD003', 3, 2, '2025-09-10', 12400000, 'RECEIVED'),
('ORD004', 1, 1, '2025-09-15', 18900000, 'RECEIVED'),
('ORD005', 4, 2, '2025-09-20', 6750000, 'RECEIVED'),
('ORD006', 2, 1, '2025-09-25', 21600000, 'RECEIVED'),
('ORD007', 5, 2, '2025-09-28', 9450000, 'RECEIVED'),
('ORD008', 1, 1, '2025-10-01', 14250000, 'RECEIVED'),
('ORD009', 3, 2, '2025-10-05', 11200000, 'RECEIVED'),
('ORD010', 4, 1, '2025-10-08', 7890000, 'RECEIVED'),
('ORD011', 2, 2, '2025-10-12', 16800000, 'RECEIVED'),
('ORD012', 1, 1, '2025-10-15', 13500000, 'PENDING');

-- Insert Order Details for ORD001 (Supplier 1 - AutoParts Vietnam)
INSERT INTO order_details (order_id, sparepart_id, quantity, unit_price, subtotal) VALUES
(1, 1, 30, 250000, 7500000),  -- Engine Oil
(1, 2, 50, 85000, 4250000),   -- Oil Filter
(1, 3, 40, 120000, 4000000);  -- Air Filter

-- Insert Order Details for ORD002 (Supplier 2)
INSERT INTO order_details (order_id, sparepart_id, quantity, unit_price, subtotal) VALUES
(2, 5, 20, 450000, 9000000);  -- Brake Pad Front - Note: total doesn't match, will fix

-- Insert Order Details for ORD003 (Supplier 3)
INSERT INTO order_details (order_id, sparepart_id, quantity, unit_price, subtotal) VALUES
(3, 9, 10, 1200000, 12000000), -- Tire 195/65R15
(3, 13, 5, 250000, 1250000);   -- Wiper Blade - Note: recalculating

-- Insert Order Details for ORD004 (Supplier 1)
INSERT INTO order_details (order_id, sparepart_id, quantity, unit_price, subtotal) VALUES
(4, 11, 10, 1800000, 18000000), -- Car Battery
(4, 4, 30, 95000, 2850000);     -- Spark Plug - Note: recalculating

-- Insert Order Details for ORD005 (Supplier 4)
INSERT INTO order_details (order_id, sparepart_id, quantity, unit_price, subtotal) VALUES
(5, 12, 100, 65000, 6500000),  -- Headlight Bulb
(5, 19, 5, 180000, 900000);    -- AC Filter - Note: recalculating

-- Insert Order Details for ORD006 (Supplier 2)
INSERT INTO order_details (order_id, sparepart_id, quantity, unit_price, subtotal) VALUES
(6, 10, 15, 1400000, 21000000), -- Tire 205/55R16
(6, 8, 10, 180000, 1800000);    -- Brake Fluid

-- Insert Order Details for ORD007 (Supplier 5)
INSERT INTO order_details (order_id, sparepart_id, quantity, unit_price, subtotal) VALUES
(7, 16, 10, 980000, 9800000);   -- Shock Absorber Front

-- Insert Order Details for ORD008 (Supplier 1)
INSERT INTO order_details (order_id, sparepart_id, quantity, unit_price, subtotal) VALUES
(8, 1, 50, 250000, 12500000),   -- Engine Oil
(8, 20, 20, 145000, 2900000);   -- Fuel Filter

-- Insert Order Details for ORD009 (Supplier 3)
INSERT INTO order_details (order_id, sparepart_id, quantity, unit_price, subtotal) VALUES
(9, 7, 15, 650000, 9750000),    -- Brake Disc Front
(9, 6, 10, 380000, 3800000);    -- Brake Pad Rear

-- Insert Order Details for ORD010 (Supplier 4)
INSERT INTO order_details (order_id, sparepart_id, quantity, unit_price, subtotal) VALUES
(10, 14, 8, 850000, 6800000),   -- Side Mirror Left
(10, 15, 8, 850000, 6800000);   -- Side Mirror Right

-- Insert Order Details for ORD011 (Supplier 2)
INSERT INTO order_details (order_id, sparepart_id, quantity, unit_price, subtotal) VALUES
(11, 18, 3, 4500000, 13500000), -- AC Compressor
(11, 17, 5, 920000, 4600000);   -- Shock Absorber Rear

-- Insert Order Details for ORD012 (Supplier 1 - Pending)
INSERT INTO order_details (order_id, sparepart_id, quantity, unit_price, subtotal) VALUES
(12, 5, 30, 450000, 13500000);  -- Brake Pad Front

-- Update order totals (recalculate based on actual order_details)
UPDATE orders o SET total_amount = (
    SELECT SUM(subtotal) FROM order_details WHERE order_id = o.id
);
