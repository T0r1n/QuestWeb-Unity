// функционал главной страницы

function selectQuest(i) {
    // выводит карточку на передний план
    // i - номер карточки

    // выделение карточки
    let k = 0
    for (let card of document.querySelector("#questSizePicker").children) {
        if (k == i) { card.style.width = "208px"; card.style.height = "280px"; card.style.zIndex = "1" }
        else { card.style.width = "192px"; card.style.height = "256px"; card.style.zIndex = "0" }
        k++
    }

    // установка индикатора
    k = 0
    for (let indicator of document.querySelector("#pickIndicator").children) {
        if (k == i) { indicator.checked = true; indicator.disabled = false }
        else { indicator.checked = false; indicator.disabled = true }
        k++
    }
}

function resetQuestSelection() {
    // возвращает исходный порядок
    let card = document.querySelector("#questSizePicker").children
    for (let i = 0; i < card.length; i++) {
        card[i].style.width = "192px"; card[i].style.height = "256px"; card[i].style.zIndex = "0"
    }
    card[1].style.width = "208px"; card[1].style.height = "280px"; card[1].style.zIndex = "1"

    let indicator = document.querySelector("#pickIndicator").children
    for (let i = 0; i < indicator.length; i++) {
        indicator[i].checked = false; indicator[i].disabled = true
    }
    indicator[1].checked = true; indicator[1].disabled = false
}


function clickOnProfile() {
    // если пользователь кликает на иконку профиля, то проверяется, вошел ли он в систему
    // если нет, то открыть меню входа
//    var loginuser = document.getElementById('my-data').getAttribute('loginuser');
    if (loginuser !== 'None'){
        window.location = 'http://127.0.0.1:5000/profile'
    }
    else if (loginuser == 'None'){
        openAuth()
    }

}

function openAuth() {
    blurBg()
    document.querySelector("#auth").style.display = "block"
}

function blurBg() {
    document.querySelector("#blurBg").style.display = "block"
}

function closeMenu() {
    // на главной одно всплывающее меню, поэтому оно будет закрыто по клику на затенение
    document.querySelector("#auth").style.display = "none"

    document.querySelector("#blurBg").style.display = "none"
}

function authSwitch(mode) {
    switch(mode) {
        case 'in':
            document.querySelector("#authSignin").style.display = "block"
            document.querySelector("#authSignup").style.display = "none"
            document.querySelector("#switchIn").style.color = "white"
            document.querySelector("#switchUp").style.color = "gray"
            break
        case 'up':
            document.querySelector("#authSignin").style.display = "none"
            document.querySelector("#authSignup").style.display = "block"
            document.querySelector("#switchIn").style.color = "gray"
            document.querySelector("#switchUp").style.color = "white"
    }
}

function openProfile() {
    // переход в меню профиля
    location.replace("./profile.html")
}

function openCreate() {
    // переход к созданию квеста
    location.replace('./create.html')
}