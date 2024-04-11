import { useState } from "react";
import { useEffect } from "react";
import * as appUtil from "util/appUtil.js";

import {questionsDummyData} from "data.js";


const InterviewQuestions = (props) => {
    const { questionTypeHandler, titleText, languageType } = props;

    const [currentIdx, setCurrentIdx] = useState(0);
    const [interviewData, setInterviewData] = useState([]);

    const pageHandler = (arg) => {
        setCurrentIdx(arg)
    }

    // 타입에 맞는 데이터 호출하는 함수 필요함
    const getInterviewData = async () => {
        let data = {
            q_type: languageType
        }

        // let result = await appUtil.getRequest("interview", data);
        let result = questionsDummyData;

        setInterviewData(result);
    }

    useEffect(() => {
        setCurrentIdx(0);
        getInterviewData();
    }, [])

    return (
        <div className="interviewContainer">
            <div className="qnaArea">
                <div className="interviewTitle">
                    <h3>
                        {titleText}
                    </h3>
                </div>
                <div className="interviewWrap">
                    <div>Q.</div>
                    <br />
                    <br />
                    <pre className="interviewQuestion">
                        {
                            interviewData[currentIdx]?.i_question
                        }
                    </pre>
                </div>
                <div className="interviewWrap">
                    <div>A.</div>
                    <br />
                    <br />
                    <pre>
                        {
                            interviewData[currentIdx]?.i_answer
                        }
                    </pre>
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