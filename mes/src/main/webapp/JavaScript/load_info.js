window.onload = function () {
    //로컬스토리지에 저장된 id를 가져오기
    let profileId = localStorage.getItem('profileId');
    if (profileId) {
        let profileElement = document.getElementById(profileId);
        console.log(profileElement)
        if (profileElement) {
            profileElement.style.display = 'block';
        }
    }

    //로컬스토리지에 저장된 id를 가져오기
    let manager = localStorage.getItem('range_grant');
    


    if (manager == 'manager') {
        let producerload = document.getElementsByClassName('manager');
        producerload[0].style.display='block';
        producerload[1].style.display='block';
        producerload[2].style.display='block';
        producerload[3].style.display='block';

    }

}