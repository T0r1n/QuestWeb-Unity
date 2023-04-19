// функционал страницы профиля
let activeSection = ""

function returnToIndex() {
    // возврат на главную по клику на логотип
    location.replace("./index.html")
}

function openSection(section) {
    // открывает новую секцию и делает ее активной
    closeActiveSection()
    activeSection = section

    switch (section) {
        case 'edit':
            document.querySelector("#edit").style.display = "block"
            break
        case 'passed':
            document.querySelector("#passed").style.display = "block"
            break
        case 'made':
            document.querySelector("#made").style.display = "block"
            break
        case 'participants':
            document.querySelector("#participants").style.display = "block"

    }
}

function closeActiveSection() {
    // если есть активная секция, то закрывает ее
    if (activeSection != "") document.querySelector('#' + activeSection).style.display = "none"
}
 
function blurBg() {
    document.querySelector("#blurBg").style.display = "block"
}

function openDeletionConfirmation() {
    blurBg()
    document.querySelector("#deletionConfirmation").style.display = "block"
}

function closeMenu() {
    document.querySelector("#deletionConfirmation").style.display = "none"
    
    document.querySelector("#blurBg").style.display = "none"
}

function deleteAccount() {
    // процесс удаления аккаунта
    returnToIndex()
}

function signOut() {
    // процесс выхода из аккаунта
    returnToIndex()
}

function openCreate() {
    // переход к созданию квеста
    location.replace('./create.html')
}