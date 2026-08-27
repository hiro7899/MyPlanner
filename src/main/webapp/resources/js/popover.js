document.addEventListener('DOMContentLoaded', () => {
	// HTML 요소 가져오기
	const daysContainer = document.getElementById('days');
	const monthYearDisplay = document.getElementById('monthYear');
	const prevButton = document.getElementById('prev');
	const nextButton = document.getElementById('next');
	const weekdaysContainer = document.getElementById('weekdays');
	const popover = document.getElementById('popover'); // Popover 엘리먼트
	const planInput = document.getElementById('plan-input');
	const savePlanButton = document.getElementById('save-plan');
	
	let currentDate = new Date(); // 현재 날짜

	// 요일 배열
	const weekdays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

	// 날짜에 대한 계획을 저장할 객체
	let plans = {};

	// 달력 렌더링 함수
	function renderCalendar() {
		const year = currentDate.getFullYear();
		const month = currentDate.getMonth();

		// 월 이름 배열
		const monthNames = [
			'January', 'February', 'March', 'April', 'May', 'June',
			'July', 'August', 'September', 'October', 'November', 'December'
		];

		// 헤더 업데이트
		monthYearDisplay.textContent = `${monthNames[month]} ${year}`;
		daysContainer.innerHTML = '';
		weekdaysContainer.innerHTML = '';

		// 요일 헤더 렌더링
		weekdays.forEach(day => {
			weekdaysContainer.innerHTML += `<div>${day}</div>`;
		});

		// 첫 날과 마지막 날짜 가져오기
		const firstDay = new Date(year, month, 1).getDay(); // 월의 첫 번째 요일 (0: Sunday, 1: Monday)
		const lastDate = new Date(year, month + 1, 0).getDate(); // 월의 마지막 날짜

		// 첫 번째 날짜 전의 빈 칸 추가 (첫 주의 시작 요일 맞추기)
		for (let i = 0; i < firstDay; i++) {
			daysContainer.innerHTML += `<div class="empty"></div>`;
		}

		// 날짜 추가
		for (let date = 1; date <= lastDate; date++) {
			const today = new Date();
			const isToday =
				date === today.getDate() &&
				month === today.getMonth() &&
				year === today.getFullYear();

			const dayElement = document.createElement('div');
			dayElement.textContent = date;
			dayElement.classList.add(isToday ? 'today' : '');
			dayElement.addEventListener('click', () => showPopover(date));

			// 저장된 계획이 있으면 표시
			if (plans[date]) {
				dayElement.title = plans[date]; // 마우스를 올리면 계획 내용 표시
			}

			daysContainer.appendChild(dayElement);
		}

		// 마지막 날짜 후의 빈 칸 추가 (다음 달의 첫 주 맞추기)
		const totalDays = firstDay + lastDate; // 총 날짜 개수
		const lastDay = new Date(year, month, lastDate).getDay(); // 마지막 날짜의 요일
		const remainingDays = 6 - lastDay; // 마지막 주에 남은 빈 칸 수

		// 남은 빈 칸을 추가
		for (let i = 0; i < remainingDays; i++) {
			daysContainer.innerHTML += `<div class="empty"></div>`;
		}
	}

	// Popover 표시 함수
	function showPopover(date) {
		// Popover 위치 설정 (날짜 클릭 위치)
		const dayElement = document.querySelector(`div[data-date='${date}']`);
		const rect = dayElement.getBoundingClientRect();

		// Popover 위치 계산
		popover.style.left = `${rect.left}px`;
		popover.style.top = `${rect.bottom + window.scrollY + 5}px`;
		popover.style.display = 'block';

		// 기존 계획 로드
		planInput.value = plans[date] || '';

		// Popover 저장 버튼 클릭 이벤트
		savePlanButton.onclick = () => {
			plans[date] = planInput.value; // 계획 저장
			popover.style.display = 'none'; // Popover 숨기기
			renderCalendar(); // 달력 갱신
		};
	}

	// 이전 달로 이동
	prevButton.addEventListener('click', () => {
		currentDate.setMonth(currentDate.getMonth() - 1);
		renderCalendar();
	});

	// 다음 달로 이동
	nextButton.addEventListener('click', () => {
		currentDate.setMonth(currentDate.getMonth() + 1);
		renderCalendar();
	});

	// 초기 렌더링
	renderCalendar();
});
