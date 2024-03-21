function isBlank(obj, message = 'Please fill the field') {
    const value = obj.value.trim();
    if (value === "") {
        alert(message);
        obj.value = "";
        obj.focus();
        return false;
    }
    return true;
};

function isNumber(obj, message = 'Field must contain string!') {
    const value = obj.value.trim();
    const validNumber = /^([+]\d{2})?\d{10}$/;
    if (!value.match(validNumber)) {
        alert(message);
        obj.value = "";
        obj.focus();
        return false;
    }
    return true;
};

function isEmail(obj, message = 'Field must contain Email!') {
    const value = obj.value.trim();
    const mail = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
    if (!value.match(mail)) {
        alert(message);
        obj.mail = "";
        obj.focus();
        return false;
    }
    return true;
};

function isChecked(obj, message = "At least one option required!") {
    const check = Array.from(obj).some(element => element.checked);
    if (!check) {
        alert(message);
        obj[0].focus();
        return false;
    }
    return true;
};

function selectAll(obj) {
    const isChecked = obj.checked;
    const inputs = document.getElementsByClassName('anemities');
    for (const input of inputs) {
        if (!isChecked) {
            input.removeAttribute('checked');
        } else {
            input.setAttribute('checked', isChecked);
        }
    }
}

function tandcChecked(obj, message = 'terma and condition is required') {
    if (!obj.checked) {
        alert(message);
        obj.focus();
        return false;
    }
    return true;
}

function prev_pages() {
    let page = document.querySelector("input[name=page]").value;
    document.querySelector("input[name=page]").value = page--;
    window.location.href = `${location.origin}${location.pathname}?page=${page}`;
}
        
function next_pages() {
    let page = document.querySelector("input[name=page]").value;
    document.querySelector("input[name=page]").value = page++;
    window.location.href = `${location.origin}/${location.pathname}?page=${page}`;
}