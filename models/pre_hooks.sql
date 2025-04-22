{{ config(
    pre_hook="CREATE TABLE {{ target.schema }}.raw_clicks (
    click_id VARCHAR(36) PRIMARY KEY, 
    user_id VARCHAR(36),              
    clicked_at TIMESTAMP,             
    ip_address VARCHAR(15)            
);"
)}}

INSERT INTO {{ target.schema }}.raw_clicks (click_id, user_id, clicked_at, ip_address) VALUES
('clk_001', 'usr_001', '2025-04-15 08:00:00', '192.168.1.1'),
('clk_002', 'usr_001', '2025-04-15 08:05:00', '192.168.1.1'),
('clk_003', 'usr_002', '2025-04-15 09:00:00', '192.168.1.2'),
('clk_004', 'usr_003', '2025-04-15 10:00:00', '192.168.1.3'),
('clk_005', 'usr_002', '2025-04-15 10:15:00', '192.168.1.2'),
('clk_006', 'usr_004', '2025-04-15 11:00:00', '192.168.1.4'),
('clk_007', 'usr_001', '2025-04-15 12:00:00', '192.168.1.1'),
('clk_008', 'usr_005', '2025-04-15 13:00:00', '192.168.1.5'),
('clk_009', 'usr_002', '2025-04-15 14:00:00', '192.168.1.2'),
('clk_010', 'usr_003', '2025-04-15 15:00:00', '192.168.1.3')