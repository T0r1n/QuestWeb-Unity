//let taskCount = document.getElementById('data').getAttribute('qcount');
//taskCount = Number(taskCount)
let taskCount = Number(qcount);
//console.log(taskCount);

let activeTask = 1 // выбранное задание, по умолчанию - первое
let scrollLimit = taskCount / 12.0 // сколько раз можно прокрутить задания
let scrollLevel = 1 // уровень прокрутки; по умолчанию - 1
let scrollValue = 0 // прокрутка в пикселях

// данные о квестах
let taskText = Array(taskCount).fill("")
let taskHint = Array(taskCount).fill("")
let taskFile = Array(taskCount).fill("")
let taskAnswer = Array(taskCount).fill("")

function returnToIndex() {
    // возврат на главную по клику на логотип
    location.replace("./index.html")
}

function generateTaskLine() {
    // создает очередь заданий нужного размера
    // !!! сейчас невозможно передать на эту страницу количество заданий, поэтому будет сгенерировано максимальное число - это условность;
    let taskLine = document.querySelector("#taskLine")

    const tasksPerRow = 14; // Количество заданий на одну строку

    let lines = taskCount / tasksPerRow; // Количество строк
    for (let i = 0; i < lines; i++) {
        let container = document.createElement("ul")
        container.className = "taskList"
        container.style.display = "flex"

        let tasks = Math.min((i + 1) * tasksPerRow, taskCount) // Количество заданий на этой строке
        for (let j = i * tasksPerRow; j < tasks; j++) {
            let node = document.createElement("li")
            let task = document.createElement("a")
            task.className = "task"

            node.style.display = "inline-block"
            node.style.width = "fit-content"
            node.style.zIndex = taskCount - j;

            if (j % tasksPerRow != 0) {
                task.style.marginLeft = "-0.4em"
            } else {
                task.style.marginLeft = "-1.4em";
            }

            task.innerHTML = (j + 1)
            //task.setAttribute("onClick", "clickedOnTask(event)")

            node.appendChild(task)
            container.append(node)
        }

        taskLine.appendChild(container)
    } 

    pickTask(1) // первое задание выбрано изначально
}

function clickedOnTask(event) {
    pickTask(event.target.innerHTML)
}

function VoidCheck(){
    var pq_text = document.getElementById("taskText").value.trim();
    var pq_answer = document.getElementById("taskAnswer").value.trim();
    var pq_name = document.getElementById("questName").value.trim();
    var pq_disc = document.getElementById("questDescription").value.trim();
    if (pq_text != "" && pq_answer != "" && pq_name != "" && pq_disc != ""){
        return true
    }else{
        return false
    }

}



function clickedOnNext() {
    var pq_name = document.getElementById("questName");
    var pq_disc = document.getElementById("questDescription");
    if (VoidCheck() == true){
        if (activeTask < taskCount){
            pickTask(parseInt(activeTask) + 1)
        }
        
        
        pq_disc.readOnly = true
        pq_name.readOnly = true
    }

}

function pickTask(picked) {
    // делает задание активным
    if (picked < 1 || picked > taskCount) return

    let tasks = document.getElementsByClassName("task")
    tasks[activeTask - 1].id = ""
    tasks[picked - 1].id = "activeTask"
    activeTask = picked

    loadTaskData()
}

function saveTaskData() {
    // сохраняет данные для активного задания при изменении значений полей
    taskText[activeTask - 1] = document.querySelector("#taskText").value
    taskHint[activeTask - 1] = document.querySelector("#taskHint").value
    taskFile[activeTask - 1] = document.querySelector("#taskPic").value
    // здесь должно быть сохранение файла задания: taskFile[activeTask - 1] = ...
    taskAnswer[activeTask - 1] = document.querySelector("#taskAnswer").value
}

function loadTaskData() {
    // загружает данные выбранного задания в поля
    document.querySelector("#taskText").value = taskText[activeTask - 1]
    document.querySelector("#taskHint").value = taskHint[activeTask - 1]
    document.querySelector("#taskPic").value = taskFile[activeTask - 1]
    // здесь будет загрузка файла
    document.querySelector("#taskAnswer").value = taskAnswer[activeTask - 1]
}

function isFull() {
    // проверяет заполнены ли все поля во всех заданиях
    // если да, то отображает кнопку "создать квест"

    for (let i = 0; i < taskCount; i++) {
        if (!taskText[i].trim() ||
            //!taskHint[i].trim() ||
            /* здесь будет проверка файла задания*/
            !taskAnswer[i].trim()) { document.querySelector("#createButton").style.display = "none"; return }
    }
    document.querySelector("#createButton").style.display = "block"
}

var JsonMass = []
var itcount = 1;
var gjsonString;

function creatJSON(){

    if (VoidCheck() == true) {

        if (itcount == 1) {
            var pq_name = document.getElementById("questName").value;
            var pq_disc = document.getElementById("questDescription").value;

            var inf = {
                q_name: pq_name,
                q_disc: pq_disc
            };
            JsonMass.push(inf)
        }
        if (itcount < taskCount + 1) {
            var pq_text = document.getElementById("taskText").value;
            var pq_answer = document.getElementById("taskAnswer").value;
            var pq_hint = document.getElementById("taskHint").value;
            var pq_pic = document.getElementById("taskPic").value;
            var proom = 1;

            var data = {
                q_text: pq_text,
                q_answer: pq_answer,
                q_hint: pq_hint,
                q_pic: pq_pic,
                room: proom,
            };
            JsonMass.push(data);
            var jsonString = JSON.stringify(JsonMass);
            console.log(JsonMass);
            itcount++
        }

        gjsonString = jsonString
        console.log(gjsonString)
    }
}


function SendJSON(){
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "/create/send");  // URL, по которому будет обрабатываться запрос в Flask
    xhr.setRequestHeader("Content-Type", "application/json");
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            console.log(xhr.responseText);
        }
    };
    xhr.send(JSON.stringify(gjsonString));
    window.location = 'http://127.0.0.1:5000/profile'
}




