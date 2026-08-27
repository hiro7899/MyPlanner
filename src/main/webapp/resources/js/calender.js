document.addEventListener("DOMContentLoaded", () => {
	const days = document.getElementById("days");
	const monthYear = document.getElementById("monthYear");
	const prevButton = document.getElementById("prev");
	const nextButton = document.getElementById("next");
	const weekdaysContainer = document.getElementById("weekdays");
	const popover = document.getElementById("popover");
	const planInput = document.getElementById("plan-input");
	const savePlanButton = document.getElementById("save-plan");
	const closePopoverButton = document.getElementById("close-popover");

	let currentDate = new Date();
	let plans = {}; // 계획을 저장할 객체
	let activeDate = null; // 현재 활성화된 날짜

	const weekdays = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];

	function renderCalendar() {
		const year = currentDate.getFullYear();
		const month = currentDate.getMonth();

		const monthNames = [
			"1월", "2월", "3월", "4월", "5월", "6월",
			"7월", "8월", "9월", "10월", "11월", "12월"
		];

		monthYear.textContent = `${year}년 ${monthNames[month]}`;
		days.innerHTML = "";
		weekdaysContainer.innerHTML = "";

		// 요일 헤더 렌더링
		weekdays.forEach(day => {
			weekdaysContainer.innerHTML += `<div>${day}</div>`;
		});

		const firstDay = new Date(year, month, 1).getDay();
		const lastDate = new Date(year, month + 1, 0).getDate();

		// 빈 칸 추가
		for (let i = 0; i < firstDay; i++) {
			days.innerHTML += `<div class="empty"></div>`;
		}

		// 날짜 추가
		for (let date = 1; date <= lastDate; date++) {
			const today = new Date();
			const isToday =
				date === today.getDate() &&
				month === today.getMonth() &&
				year === today.getFullYear();

			const plan = plans[`${year}-${month}-${date}`] || ""; // 계획 가져오기

			days.innerHTML += `
				<div class="${isToday ? "today" : ""}" data-date="${year}-${month}-${date}">
					<div class="dates">
						${date}
					</div>
					${plan ? `<div class="plan-indicator">📌</div>` : ""}
				</div>`;
		}

		// 빈 칸 추가
		const remainingDays = (7 - ((firstDay + lastDate) % 7)) % 7;
		for (let i = 0; i < remainingDays; i++) {
			days.innerHTML += `<div class="empty"></div>`;
		}

		// 날짜 클릭 이벤트 추가
		document.querySelectorAll(".dates").forEach(dateEl => {
			dateEl.addEventListener("click", (e) => {
				const parent = e.target.parentNode;
				const date = parent.dataset.date;
				showPopover(date, e.pageX, e.pageY);
			});
		});
	}

	function showPopover(date, x, y) {
		activeDate = date; // 활성화된 날짜 저장
		planInput.value = plans[date] || ""; // 기존 계획 로드
		popover.style.display = "block";
		popover.style.left = `${x}px`;
		popover.style.top = `${y}px`;
	}

	function hidePopover() {
		popover.style.display = "none";
		activeDate = null;
	}

	// 계획 저장
	savePlanButton.addEventListener("click", () => {
		if (activeDate) {
			plans[activeDate] = planInput.value; // 계획 저장
			renderCalendar(); // 달력 갱신
			hidePopover(); // 팝오버 닫기
		}
	});

	// 팝오버 닫기
	closePopoverButton.addEventListener("click", hidePopover);

	// 이전 달로 이동
	prevButton.addEventListener("click", () => {
		currentDate.setMonth(currentDate.getMonth() - 1);
		renderCalendar();
	});

	// 다음 달로 이동
	nextButton.addEventListener("click", () => {
		currentDate.setMonth(currentDate.getMonth() + 1);
		renderCalendar();
	});

	// 초기 렌더링
	renderCalendar();
});
