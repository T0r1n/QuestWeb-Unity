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
    document.querySelector("#auth").style.display = "flex"
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
            document.querySelector("#switchIn").style.color = "black"
            document.querySelector("#switchUp").style.color = "gray"
            break
        case 'up':
            document.querySelector("#authSignin").style.display = "none"
            document.querySelector("#authSignup").style.display = "block"
            document.querySelector("#switchIn").style.color = "gray"
            document.querySelector("#switchUp").style.color = "black"
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

function StartPage(){
BackgroundParticles();
BackgroundVideo();
}

function BackgroundParticles()  {
var particles = Particles.init({
  selector: ".background",
  color: ["#03dac6", "#ff0266", "#000000"],
  connectParticles: true,
  responsive: [
    {
      breakpoint: 768,
      options: {
        color: ["#faebd7", "#03dac6", "#ff0266"],
        maxParticles: 43,
        connectParticles: false
      }
    }
  ]
});
}

function BackgroundVideo(){
        var video = document.getElementById("Video1");
        video.volume = 0;
        video.play();
        document.querySelector("#timelineVideo").setAttribute("max", video.duration)
        var range = document.querySelector("#timelineVideo")
        video.addEventListener("timeupdate", function(event){
            var pos = this.currentTime/this.duration;
            range.value = pos*range.max
        })
        range.oninput = function(event){
            video.pause()
            video.currentTime = range.value/range.max * video.duration
            vidplay()
        }
        var lastVolume = 0
        var mute = true;
        var VolRange = document.querySelector("#volInput");
        VolRange.oninput = function(event){
            video.volume = VolRange.value/100;
            console.log(video.volume)
            console.log(VolRange.value)
            lastVolume = VolRange.value/100
            if(lastVolume != 0){
                mute = false
                document.getElementById("mutedBtn").style.display = 'none'
                document.getElementById("unmutedBtn").style.display = 'block'
            }
            else{
                mute = true
                document.getElementById("mutedBtn").style.display = 'block'
                document.getElementById("unmutedBtn").style.display = 'none'

            }
        }
        function updateMuteBtn(){
            if(mute === true){
                VolRange.value = lastVolume;

                document.getElementById("mutedBtn").style.display = 'none'
                document.getElementById("unmutedBtn").style.display = 'block'
                video.volume = VolRange.value/100
                mute = false
            }
            else{
                lastVolume = VolRange.value
                VolRange.value = 0
                document.getElementById("mutedBtn").style.display = 'block'
                document.getElementById("unmutedBtn").style.display = 'none'
                video.volume = 0
                mute = true
            }
        }
        document.querySelector("#VolButton").onclick = function(event){
            updateMuteBtn()
        }
    }

    function redirectToPage() {
      var houseElement = document.getElementById('house');
      var roomsValue = houseElement.getAttribute('data-rooms');
      if (roomsValue) {
        var redirectURL = 'http://127.0.0.1:5000/create/' + roomsValue*4;
        console.log(roomsValue*4);
        if (4 <= roomsValue * 4 && roomsValue * 4 <= 32) {
            window.location = redirectURL;
        }
      }
    }

