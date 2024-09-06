// 수정하기 모달창
		document.addEventListener('DOMContentLoaded', function () {
			const modal = document.querySelector('.bom_modal');
			const btns = document.querySelectorAll('.bom_modal_btn');
			const closeModal = document.querySelector('.closeModal');

			btns.forEach(function (btn) {
				btn.addEventListener("click", function () {
					const tr = btn.closest('tr');
					const tds = tr.querySelectorAll('td');
					const content = tr.querySelectorAll('.content');
					document.getElementById('document_id').textcontent = tds[1].textContent.trim();
					document.getElementById('input_document_id').value = tds[1].textContent.trim();
					document.getElementById('input_userid').value = tds[2].textContent.trim();
					document.getElementById('title').value = tds[3].textContent.trim();
					const input = tds[4].querySelector('input');
					document.getElementById('content').value = input.value.trim();

					
					
					
					
					let created_date = tds[5].textContent.trim();
					const cDate = new Date(created_date);
					let cyyyy = cDate.getFullYear();
					let cmm = String(cDate.getMonth() + 1).padStart(2, '0');
					let cdd = String(cDate.getDate()).padStart(2, '0');
					const create = `${cyyyy}-${cmm}-${cdd}`;
					
					let updated_date = tds[6].textContent.trim();
					const uDate = new Date(updated_date);
					let pyyyy = uDate.getFullYear();
					let pmm = String(uDate.getMonth() + 1).padStart(2, '0');
					let pdd = String(uDate.getDate()).padStart(2, '0');
					const update = `${pyyyy}-${pmm}-${pdd}`;
					
					document.getElementById('created_date').textContent = created_date;
					document.getElementById('updated_date').textContent = updated_date;
					
					document.getElementById('input_created_date').value = create;
					document.getElementById('input_updated_date').value = getTodayDate();
					
					document.getElementById('version').value = tds[7].textContent.trim();

					modal.style.display = "flex";
				});
			});

			// 닫기 버튼 클릭 시 모달창 닫기
			closeModal.addEventListener("click", function () {
				modal.style.display = "none";
			});

			// 모달창 외부 클릭 시 모달창 닫기
			window.addEventListener("click", function (event) {
				if (event.target === modal) {
					modal.style.display = "none";
				}
			});

			// 수정하기 클릭시 form submit 하기
			document.querySelector('.modifyModal').addEventListener('click', function () {
				document.querySelector('#modalForm').submit();
			})

			///////////////////// create modal js ///////////////////////////////////

			const createBtn = document.querySelector('.createBtn');
			const createModal = document.querySelector('.bom_modal_create');
			const createCloseModal = document.querySelector('.createCloseModal');

			createBtn.addEventListener('click', function () {
				createModal.style.display = "flex";
			})

			createCloseModal.addEventListener("click", function () {
				createModal.style.display = "none";
			});

			// 모달창 외부 클릭 시 모달창 닫기
			window.addEventListener("click", function (event) {
				if (event.target === createModal) {
					createModal.style.display = "none";
				}
			});

			// 수정하기 클릭시 form submit 하기
			document.querySelector('.createModal').addEventListener('click', function () {
				document.querySelector('#createmodalForm').submit();
			})


		});