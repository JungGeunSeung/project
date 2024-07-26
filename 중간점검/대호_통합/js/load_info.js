window.onload = function () {
    //로컬스토리지에 저장된 id를 가져오기
    let profileId = localStorage.getItem('profileId');
    console.log(profileId);
    if (profileId) {
        let profileElement = document.getElementById(profileId);
        console.log(profileElement)
        if (profileElement) {
            profileElement.style.display = 'block';
        }
    }

    //로컬스토리지에 저장된 id를 가져오기
    let manager = localStorage.getItem('range_grant');
    console.log(manager)

    if (manager) {
        let producerload = document.querySelectorAll('#'+ 'manager');
        console.log(producerload);
        for(let i=0;i<=producerload.length;i++){
            if (producerload) {
                producerload[i].style.display = 'block';
            }
        }

    }
}