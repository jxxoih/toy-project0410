import { useState } from "react";
import { useEffect } from "react";


const dummyData = [
    {
        i_question: "안녕",
        i_answer: "답변입니다."
    },
    {
        i_question: "안녕2222",
        i_answer: "답변입니다22222."
    },
    {
        i_question: "안녕3333",
        i_answer: "답변입니다333."
    }
]


const InterviewQuestions = (props) => {
    const { questionTypeHandler, titleText } = props;

    const [currentIdx, setCurrentIdx] = useState(0);
    const [interviewData, setInterviewData] = useState([]);

    const pageHandler = (arg) => {
        setCurrentIdx(arg)
    }

    // 타입에 맞는 데이터 호출하는 함수 필요함

    useEffect(() => {
        setCurrentIdx(0);
        setInterviewData(dummyData);
    }, [])

    return (
        <div className="interviewContainer">
            <div className="qnaArea">
                <div className="interviewTitle">
                    <h3>
                        {titleText}
                    </h3>
                </div>
                <div>
                    Q.
                    <br />
                    <br />
                    {
                        interviewData[currentIdx]?.i_question
                    }
                </div>
                <div>
                    A.
                    <br />
                    <br />
                    {
                        interviewData[currentIdx]?.i_answer
                    }
                </div>
            </div>

            <div className="pageControllArea">
                <div>
                    <button
                        onClick={() => pageHandler(currentIdx - 1)}
                        disabled={currentIdx === 0 ? true : false}
                    >
                        이전
                    </button>
                </div>
                <div>
                    <button
                        onClick={() => questionTypeHandler(-1)}
                    >목록
                    </button>
                </div>
                <div>
                    <button
                        onClick={() => pageHandler(currentIdx + 1)}
                        disabled={currentIdx === interviewData.length - 1 ? true : false}
                    >
                        다음
                    </button>
                </div>
            </div>
        </div>
    );
}

export default InterviewQuestions;