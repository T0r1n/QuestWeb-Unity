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
    document.querySelector("#QuestConfirmation").style.display = "none"
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

function openDeleteQuestConfirmation(code) {
    blurBg()
    document.querySelector("#QuestConfirmation").style.display = "block"
    document.querySelector('#btnConfirmQuestDelete').onclick = (e) => {
        location.replace(`./profile/questdelete/${code}`)
    }
}

function players(code){
    var container = document.getElementById('participants');
    container.innerHTML = '';
    $.ajax({
          url: '/profile/questdata/'+ code,  // Замените на свой маршрут в Flask
          type: 'GET',        // Используйте GET, POST или другой метод, подходящий для вашего случая
            success: function(response) {
                // Обработка успешного ответа от сервера
            console.log(response);
            for (var i = 0; i < response.length; i++) {
                var item = response[i];
              //console.log('ID:', item.id);
              //   var div = document.createElement('div');
              //   div.className = 'myDiv';
              //   div.textContent = item.login;
              //   container.appendChild(div);

                var div = document.createElement('div');
                div.id = 'listEntry';
                var anchor = document.createElement('a');
                anchor.id = 'passedEntryName';
                anchor.textContent = "Пользователь " + item.nick;
                div.appendChild(anchor);
                container.appendChild(div);
            }
          },
          error: function(error) {
            // Обработка ошибки
            console.error(error);
          }

    });

}

