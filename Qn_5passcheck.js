document.addEventListener('DOMContentLoaded', function () { //An event listener to check if page is fully loaded and pulls required details
    const passwordInput = document.getElementById('password'); 
    const passStrength = document.getElementById('password-strength');

    passwordInput.addEventListener('input', function () { //Event listener to pull input password whenever input occurs
        const password = passwordInput.value;
        const strength = findpassStrength(password);
        
        if (strength <= 2) { //Classifying the strength of the password using points
            passStrength.className = 'strength-weak';
            passwordStrength.textContent = 'Strength: Weak';
        } else if (strength > 2 && strength <=5) {
            passStrength.className = 'strength-medium';
            passStrength.textContent = 'Strength: Medium';
        } else {
            passStrength.className = 'strength-strong';
            passStrength.textContent = 'Strength: Strong';
        }
    });

    function findpassStrength(password) { //function to find the sstrngth of the password

        let strength = 0;
        
        if (/[a-zA-Z]/.test(password)) { 
            strength++;
        }

        if (/\d/.test(password)) {
            strength++;
        }

        if (/[A-Z]/.test(password)) {
            strength++;
        }

        if (/[a-z]/.test(password)) {
            strength++;
        }

        if (/[\W_]/.test(password)) { //checks for special characters
            strength++;
        }
        
        if (password.length < 6) { //checks length of password
            strength--;
        } else if (password.length > 6 && password.length < 10) {
            strength++;
        } else {
            strength+=2;
        }

        return strength;
    }


});
