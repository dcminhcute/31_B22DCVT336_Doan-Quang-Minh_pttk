/**
 * Statistics JavaScript
 * Handles date validation and table interactions
 */

document.addEventListener('DOMContentLoaded', function() {
    const startDate = document.getElementById('startDate');
    const endDate = document.getElementById('endDate');
    const filterForm = document.querySelector('.filter-form');
    
    /**
     * Validate date range
     */
    function validateDateRange() {
        if (!startDate || !endDate) {
            return true;
        }
        
        const start = new Date(startDate.value);
        const end = new Date(endDate.value);
        
        if (start > end) {
            alert('Start date must be before or equal to end date.');
            return false;
        }
        
        // Check if date range is too large (optional, e.g., max 1 year)
        const daysDiff = (end - start) / (1000 * 60 * 60 * 24);
        if (daysDiff > 365) {
            const confirm = window.confirm(
                'You have selected a date range of more than 1 year. ' +
                'This may take longer to process. Continue?'
            );
            return confirm;
        }
        
        return true;
    }
    
    /**
     * Form submission validation
     */
    if (filterForm) {
        filterForm.addEventListener('submit', function(e) {
            if (!validateDateRange()) {
                e.preventDefault();
                return false;
            }
            
            // Show loading indicator
            const submitButton = this.querySelector('button[type="submit"]');
            if (submitButton) {
                submitButton.disabled = true;
                submitButton.innerHTML = '<span class="btn-icon">⏳</span> Loading...';
            }
        });
    }
    
    /**
     * Set max date to today for end date
     */
    if (endDate) {
        const today = new Date().toISOString().split('T')[0];
        endDate.setAttribute('max', today);
    }
    
    /**
     * Auto-adjust end date when start date changes
     */
    if (startDate && endDate) {
        startDate.addEventListener('change', function() {
            const start = new Date(this.value);
            const end = new Date(endDate.value);
            
            if (start > end) {
                endDate.value = this.value;
            }
        });
    }
    
    /**
     * Table sorting functionality (optional enhancement)
     */
    function enableTableSorting() {
        const tables = document.querySelectorAll('.data-table');
        
        tables.forEach(table => {
            const headers = table.querySelectorAll('th');
            
            headers.forEach((header, index) => {
                // Skip action column
                if (header.textContent.trim().toLowerCase() === 'action') {
                    return;
                }
                
                header.style.cursor = 'pointer';
                header.title = 'Click to sort';
                
                header.addEventListener('click', function() {
                    sortTable(table, index);
                });
            });
        });
    }
    
    /**
     * Sort table by column
     */
    function sortTable(table, columnIndex) {
        const tbody = table.querySelector('tbody');
        const rows = Array.from(tbody.querySelectorAll('tr'));
        
        // Determine sort direction
        const currentDirection = table.dataset.sortDirection || 'asc';
        const newDirection = currentDirection === 'asc' ? 'desc' : 'asc';
        table.dataset.sortDirection = newDirection;
        
        // Sort rows
        rows.sort((a, b) => {
            const aValue = a.cells[columnIndex].textContent.trim();
            const bValue = b.cells[columnIndex].textContent.trim();
            
            // Try to parse as number
            const aNum = parseFloat(aValue.replace(/[^0-9.-]/g, ''));
            const bNum = parseFloat(bValue.replace(/[^0-9.-]/g, ''));
            
            if (!isNaN(aNum) && !isNaN(bNum)) {
                return newDirection === 'asc' ? aNum - bNum : bNum - aNum;
            }
            
            // String comparison
            return newDirection === 'asc' 
                ? aValue.localeCompare(bValue) 
                : bValue.localeCompare(aValue);
        });
        
        // Re-append rows
        rows.forEach(row => tbody.appendChild(row));
    }
    
    // Enable table sorting
    // enableTableSorting();
    
    /**
     * Highlight table row on hover
     */
    const dataTableRows = document.querySelectorAll('.data-table tbody tr');
    dataTableRows.forEach(row => {
        row.addEventListener('click', function() {
            // Remove previous highlight
            dataTableRows.forEach(r => r.classList.remove('selected'));
            // Add highlight to clicked row
            this.classList.add('selected');
        });
    });
    
    /**
     * Quick date range presets (optional enhancement)
     */
    function addDatePresets() {
        const filterSection = document.querySelector('.filter-section');
        if (!filterSection || !startDate || !endDate) {
            return;
        }
        
        const presetsDiv = document.createElement('div');
        presetsDiv.className = 'date-presets';
        presetsDiv.style.marginTop = '1rem';
        presetsDiv.innerHTML = `
            <label>Quick Select:</label>
            <button type="button" class="btn btn-small" onclick="setDateRange(7)">Last 7 Days</button>
            <button type="button" class="btn btn-small" onclick="setDateRange(30)">Last 30 Days</button>
            <button type="button" class="btn btn-small" onclick="setDateRange(90)">Last 90 Days</button>
            <button type="button" class="btn btn-small" onclick="setDateRange(365)">Last Year</button>
        `;
        
        filterForm.appendChild(presetsDiv);
    }
    
    /**
     * Set date range preset
     */
    window.setDateRange = function(days) {
        const end = new Date();
        const start = new Date();
        start.setDate(start.getDate() - days);
        
        if (startDate) {
            startDate.value = start.toISOString().split('T')[0];
        }
        if (endDate) {
            endDate.value = end.toISOString().split('T')[0];
        }
    };
    
    // Uncomment to add date presets
    // addDatePresets();
});
