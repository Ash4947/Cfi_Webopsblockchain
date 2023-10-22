document.addEventListener('DOMContentLoaded', function () {
    const passwordInput = document.getElementById('password');
    const passStrength = document.getElementById('password-strength');

    passwordInput.addEventListener('input', function () {
        const password = passwordInput.value;
        const strength = findpassStrength(password);
        
        if (strength <= 2) {
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

    function findpassStrength(password) {

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

        if (/[\W_]/.test(password)) {
            strength++;
        }
        
        if (password.length < 6) {
            strength--;
        } else if (password.length > 6 && password.length < 10) {
            strength++;
        } else {
            strength+=2;
        }

        return strength;
    }


});
