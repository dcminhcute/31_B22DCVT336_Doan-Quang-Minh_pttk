/**
 * Appointment Booking JavaScript
 * Handles date/time validation and form submission
 */

document.addEventListener('DOMContentLoaded', function() {
    const appointmentForm = document.getElementById('bookingForm');
    const appointmentDate = document.getElementById('appointmentDate');
    const appointmentTime = document.getElementById('appointmentTime');
    
    // Set minimum date to today
    if (appointmentDate) {
        const today = new Date().toISOString().split('T')[0];
        appointmentDate.setAttribute('min', today);
        
        // Validate date on change
        appointmentDate.addEventListener('change', function() {
            validateAppointmentDate();
        });
    }
    
    // Validate time when date or time changes
    if (appointmentTime) {
        appointmentTime.addEventListener('change', function() {
            validateAppointmentTime();
        });
    }
    
    // Form submission validation
    if (appointmentForm) {
        appointmentForm.addEventListener('submit', function(e) {
            if (!validateForm()) {
                e.preventDefault();
                return false;
            }
        });
    }
    
    /**
     * Validate appointment date
     */
    function validateAppointmentDate() {
        const selectedDate = new Date(appointmentDate.value);
        const today = new Date();
        today.setHours(0, 0, 0, 0);
        
        if (selectedDate < today) {
            alert('Cannot book appointment for past dates. Please select a future date.');
            appointmentDate.value = '';
            return false;
        }
        
        return true;
    }
    
    /**
     * Validate appointment time
     */
    function validateAppointmentTime() {
        if (!appointmentDate.value || !appointmentTime.value) {
            return true;
        }
        
        const selectedDate = new Date(appointmentDate.value);
        const today = new Date();
        today.setHours(0, 0, 0, 0);
        
        // If appointment is today, check time
        if (selectedDate.getTime() === today.getTime()) {
            const currentTime = new Date();
            const selectedTime = appointmentTime.value.split(':');
            const appointmentDateTime = new Date();
            appointmentDateTime.setHours(parseInt(selectedTime[0]), parseInt(selectedTime[1]), 0);
            
            if (appointmentDateTime <= currentTime) {
                alert('Cannot book appointment for past times. Please select a future time.');
                appointmentTime.value = '';
                return false;
            }
        }
        
        return true;
    }
    
    /**
     * Validate entire form before submission
     */
    function validateForm() {
        // Validate service type
        const serviceType = document.getElementById('serviceType');
        if (!serviceType || !serviceType.value) {
            alert('Please select a service type.');
            serviceType.focus();
            return false;
        }
        
        // Validate date
        if (!appointmentDate || !appointmentDate.value) {
            alert('Please select an appointment date.');
            appointmentDate.focus();
            return false;
        }
        
        if (!validateAppointmentDate()) {
            return false;
        }
        
        // Validate time
        if (!appointmentTime || !appointmentTime.value) {
            alert('Please select an appointment time.');
            appointmentTime.focus();
            return false;
        }
        
        if (!validateAppointmentTime()) {
            return false;
        }
        
        return true;
    }
    
    /**
     * Disable weekends (optional enhancement)
     */
    function disableWeekends() {
        if (appointmentDate) {
            appointmentDate.addEventListener('input', function() {
                const date = new Date(this.value);
                const day = date.getDay();
                
                // 0 = Sunday, 6 = Saturday
                if (day === 0 || day === 6) {
                    alert('Sorry, we are closed on weekends. Please select a weekday.');
                    this.value = '';
                }
            });
        }
    }
    
    // Uncomment to enable weekend blocking
    // disableWeekends();
    
    /**
     * Show loading indicator on form submit
     */
    if (appointmentForm) {
        appointmentForm.addEventListener('submit', function() {
            const submitButton = this.querySelector('button[type="submit"]');
            if (submitButton) {
                submitButton.disabled = true;
                submitButton.innerHTML = '<span class="btn-icon">⏳</span> Processing...';
            }
        });
    }
});
