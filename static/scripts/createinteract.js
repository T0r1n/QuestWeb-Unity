let taskCount = 32 // условное число заданий, оно должно поступать с сервера(?) при запросе пользователя на создание квеста
let activeTask = 1 // выбранное задание, по умолчанию - первое
let scrollLimit = taskCount / 12.0 // сколько раз можно прокрутить задания
let scrollLevel = 1 // уровень прокрутки; по умолчанию - 1
let scrollValue = 0 // прокрутка в пикселях

// данные о квестах
let taskText = Array(taskCount).fill("")
let taskHint = Array(taskCount).fill("")
let taskFile = Array(taskCount) // не работает
let taskAnswer = Array(taskCount).fill("")

function returnToIndex() {
    // возврат на главную по клику на логотип
    location.replace("./index.html")
}

function generateTaskLine() {
    // создает очередь заданий нужного размера
    // !!! сейчас невозможно передать на эту страницу количество заданий, поэтому будет сгенерировано максимальное число - это условность;
    let tasks = document.querySelector("#tasks")
    
    for (let i = 1; i <= taskCount; i++) {
        let container = document.createElement("DIV")
        let task = document.createElement("A")

        container.style.display = "inline-block"
        container.style.width = "fit-content"

        task.style.display = "flex"
        task.style.justifyContent = "center"
        task.style.alignItems = "center"
        task.style.fontSize = "20px"
        task.style.width = "40px"
        task.style.height = "40px"
        task.style.borderRadius = "25px"
        task.style.color = "black"
        
        if (i != 1) task.style.marginLeft = "3.5px" // отступ для умещения ровно 12 заданий

        task.innerHTML = (i)
        task.setAttribute("id", i)
        task.setAttribute("onClick", "clickedOnTask(event)")

        container.appendChild(task)
        tasks.appendChild(container)
    }

    pickTask(1) // первое задание выбрано изначально
}

function scrollTasks(x) {
    // скроллит задания
    // если x == -1, то влево; если x == 1, то вправо

    switch (x) {
        case -1:
            if (scrollLevel > 1) {
                scrollValue += 522
                document.querySelector("#tasks").style.left = scrollValue.toString() + "px"
                scrollLevel--
            }
            break
        case 1:
            if (scrollLevel < scrollLimit) {
                scrollValue -= 522
                document.querySelector("#tasks").style.left = scrollValue.toString() + "px"
                scrollLevel++
            }
    }
}

function clickedOnTask(event) {
    pickTask(event.target.id)
}

function clickedOnNext() {
    if (activeTask < taskCount) pickTask(parseInt(activeTask) + 1)
}

function pickTask(picked) {
    // делает задание активным
    if (picked < 1 || picked > taskCount) return

    document.querySelector('[id="' + activeTask + '"]').style.backgroundColor = "white"
    activeTask = picked
    document.querySelector('[id="' + activeTask + '"]').style.backgroundColor = "rgba(0, 0, 0, 0.3)"
    loadTaskData()
}

function saveTaskData() {
    // сохраняет данные для активного задания при изменении значений полей
    taskText[activeTask - 1] = document.querySelector("#taskText").value
    taskHint[activeTask - 1] = document.querySelector("#taskHint").value
    // здесь должно быть сохранение файла задания: taskFile[activeTask - 1] = ...
    taskAnswer[activeTask - 1] = document.querySelector("#taskAnswer").value
}

function loadTaskData() {
    // загружает данные выбранного задания в поля
    document.querySelector("#taskText").value = taskText[activeTask - 1]
    document.querySelector("#taskHint").value = taskHint[activeTask - 1]
    // здесь будет загрузка файла
    document.querySelector("#taskAnswer").value = taskAnswer[activeTask - 1]
}

function isFull() {
    // проверяет заполнены ли все поля во всех заданиях
    // если да, то отображает кнопку "создать квест"

    for (let i = 0; i < taskCount; i++) {
        if (!taskText[i].trim() ||
            !taskHint[i].trim() ||
            /* здесь будет проверка файла задания*/
            !taskAnswer[i].trim()) { document.querySelector("#createButton").style.display = "none"; return }
    }
    document.querySelector("#createButton").style.display = "block"
}