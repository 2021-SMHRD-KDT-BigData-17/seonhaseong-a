//add hovered class to selected list item
let list = document.querySelectorAll(".navigation li");

function activeLink(){
    list.forEach(item=>{
        item.classList.remove("hovered");
    })
    this.classList.add("hovered");
}

list.forEach(item=> item.addEventListener("mouseover", activeLink))

//메뉴 토글
let toggle = document.querySelector(".toggle");
let navigation = document.querySelector(".navigation");
let main = document.querySelector(".main");
let topbar =document.querySelector(".topbar");


toggle.onclick = function(){
    navigation.classList.toggle("active");
    main.classList.toggle("active");
    topbar.classList.toggle("active");
   
    
}


document.addEventListener('DOMContentLoaded', ()=>{
    var interval = window.setInterval(rollingCallback, 3000);
})
function rollingCallback(){
    //.prev 클래스 삭제
    document.querySelector('.rollingbanner .prev').classList.remove('prev');

    //.current -> .prev
    let current = document.querySelector('.rollingbanner .current');
    current.classList.remove('current');
    current.classList.add('prev');

    //.next -> .current
    let next = document.querySelector('.rollingbanner .next');
    //다음 목록 요소가 널인지 체크
    if(next.nextElementSibling == null){
        document.querySelector('.rollingbanner ul li:first-child').classList.add('next');
    }else{
    	//목록 처음 요소를 다음 요소로 선택
        next.nextElementSibling.classList.add('next');
    }
    next.classList.remove('next');
    next.classList.add('current');
}


// function toggleBtn1() {
  
//     // 토글 할 버튼 선택 (btn1)
//     const btn1 = document.getElementById('text');
    
//     // btn1 숨기기 (display: none)
//     if(btn1.style.display !== 'none') {
//       btn1.style.display = 'none';
//     }
//     // btn` 보이기 (display: block)
//     else {
//       btn1.style.display = 'block';
//     }
// }

document.getElementById("p-btn").addEventListener("click", function() {
    document.getElementById("pname").style.display = "none";
    document.getElementById("p-btn").style.display = "none";
    document.getElementById("p-form").style.display = "block";
  });

  document.getElementById("re-btn").addEventListener("click", function() {
    document.getElementById("p-form").style.display = "none";
    document.getElementById("pname").style.display = "inline";
    document.getElementById("p-btn").style.display = "inline";
  });

  document.getElementById("day-clik").addEventListener("click", function() {
    document.getElementById("dbox").click();
  });