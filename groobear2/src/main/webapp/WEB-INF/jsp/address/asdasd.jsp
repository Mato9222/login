<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>받는 사람 입력</title>
    <style>
        .input-container {
            display: flex;
            align-items: center;
            flex-wrap: wrap;
            border: 1px solid #ccc;
            padding: 5px;
            border-radius: 4px;
            width: 80%;
            min-height: 40px;
        }

        .tag {
            display: flex;
            align-items: center;
            background-color: #e8f4ff;
            color: #000;
            border-radius: 15px;
            padding: 5px 10px;
            margin: 3px;
            font-size: 14px;
        }

        .tag.error {
            background-color: #ffe8e8;
            color: #000;
        }

        .tag .edit-icon {
            margin: 0 5px;
            cursor: pointer;
            font-size: 12px;
        }

        .tag .remove-btn {
            background-color: transparent;
            border: none;
            font-size: 14px;
            margin-left: 5px;
            cursor: pointer;
            color: #555;
        }

        .input-container input {
            border: none;
            outline: none;
            flex: 1;
            min-width: 100px;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <label for="recipient-input">받는 사람</label>
    <div class="input-container" id="input-container">
        <input type="text" id="recipient-input" placeholder="받는 사람 입력 후 스페이스바">
    </div>

    <script>
        const inputContainer = document.getElementById('input-container');
        const recipientInput = document.getElementById('recipient-input');

        // 이메일 유효성 검사
        function isValidEmail(email) {
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            return emailRegex.test(email);
        }

        // 그룹 추가 함수
        function addTag(value) {
            if (!value.trim()) return;

            // 태그 요소 생성
            const tag = document.createElement('div');
            tag.classList.add('tag');
            if (!isValidEmail(value)) {
                tag.classList.add('error'); // 이메일 형식이 아닐 경우 에러 클래스 추가
            }

            // HTML을 올바르게 생성
            tag.innerHTML = `
                \${value} <!-- 여기서 템플릿 리터럴은 값으로 처리 -->
                <span class="edit-icon">✏️</span>
                <button class="remove-btn">&times;</button>
            `;

            // 삭제 버튼 이벤트 추가
            tag.querySelector('.remove-btn').addEventListener('click', () => {
                tag.remove();
            });

            // 입력 필드 앞에 태그 추가
            inputContainer.insertBefore(tag, recipientInput);
        }

        // 스페이스바 입력 이벤트
        recipientInput.addEventListener('keydown', (e) => {
            if (e.key === ' ') {
                const inputValue = recipientInput.value.trim();
                addTag(inputValue); // 태그 추가
                recipientInput.value = ''; // 입력 필드 초기화
                e.preventDefault(); // 기본 스페이스바 동작 방지
            }
        });

        // 태그 수정 이벤트
        inputContainer.addEventListener('click', (e) => {
            if (e.target.classList.contains('edit-icon')) {
                const tag = e.target.parentElement;
                const tagValue = tag.textContent.trim();
                recipientInput.value = tagValue; // 입력 필드로 값 이동
                tag.remove(); // 기존 태그 삭제
            }
        });
    </script>
</body>
</html>