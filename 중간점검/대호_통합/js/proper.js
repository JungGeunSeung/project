let jan = document.querySelector('#btn1')
let one = document.querySelector('.monthHI1월')
let feb = document.querySelector('#btn2')
let two = document.querySelector('.monthHI2월')
let mar = document.querySelector('#btn3')
let three = document.querySelector('.monthHI3월')
let apr = document.querySelector('#btn4')
let four = document.querySelector('.monthHI4월')
let may = document.querySelector('#btn5')
let five = document.querySelector('.monthHI5월')
let jun = document.querySelector('#btn6')
let six = document.querySelector('.monthHI6월')
let jul = document.querySelector('#btn7')
let seven = document.querySelector('.monthHI7월')
let aug = document.querySelector('#btn8')
let eight= document.querySelector('.monthHI8월')
let sep = document.querySelector('#btn9')
let nine = document.querySelector('.monthHI9월')
let oct = document.querySelector('#btn10')
let ten= document.querySelector('.monthHI10월')
let nov = document.querySelector('#btn11')
let ele = document.querySelector('.monthHI11월')
let dec = document.querySelector('#btn12')
let twe = document.querySelector('.monthHI12월')
let HI = document.querySelector('.tableHI')
let all = document.querySelector('#btn0')
let All = HI;

all.addEventListener('click',function(){
    HI.setAttribute('style','display:block')
})
jan.addEventListener('click',function(){
    if(All){
        All.setAttribute('style','display:none')
    }
    one.setAttribute('style','display:block')
    All = one
})
feb.addEventListener('click',function(){

    if(All){
        All.setAttribute('style','display:none')
    }
    two.setAttribute('style','display:block')
    All = two
})
mar.addEventListener('click',function(){

    if(All){
        All.setAttribute('style','display:none')
    }
    three.setAttribute('style','display:block')
    All = three
})
apr.addEventListener('click',function(){

    if(All){
        All.setAttribute('style','display:none')
    }
    four.setAttribute('style','display:block')
    All = four
})
may.addEventListener('click',function(){

    if(All){
        All.setAttribute('style','display:none')
    }
    five.setAttribute('style','display:block')
    All = five
})
jun.addEventListener('click',function(){

    if(All){
        All.setAttribute('style','display:none')
    }
    six.setAttribute('style','display:block')
    All = six
})
jul.addEventListener('click',function(){

    if(All){
        All.setAttribute('style','display:none')
    }
    seven.setAttribute('style','display:block')
    All = seven
})
aug.addEventListener('click',function(){

    if(All){
        All.setAttribute('style','display:none')
    }
    eight.setAttribute('style','display:block')
    All = eight
})
sep.addEventListener('click',function(){

    if(All){
        All.setAttribute('style','display:none')
    }
    nine.setAttribute('style','display:block')
    All = nine
})
oct.addEventListener('click',function(){

    if(All){
        All.setAttribute('style','display:none')
    }
    ten.setAttribute('style','display:block')
    All = ten
})
nov.addEventListener('click',function(){

    if(All){
        All.setAttribute('style','display:none')
    }
    ele.setAttribute('style','display:block')
    All = ele
})
dec.addEventListener('click',function(){

    if(All){
        All.setAttribute('style','display:none')
    }
    twe.setAttribute('style','display:block')
    All = twe
})