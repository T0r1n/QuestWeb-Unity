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
        //task.setAttribute("onClick", "clickedOnTask(event)")

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
        if (activeTask < taskCount) pickTask(parseInt(activeTask) + 1)
        pq_disc.readOnly = true
        pq_name.readOnly = true
    }

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




