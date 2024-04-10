import { useState } from "react";
import "styles/question.css";
import SelectQuestion from "components/SelectQuestion";
import InterviewQuestions from "./InterviewQuestions";
import SkillInterview from "./SkillInterview";


const Question = () => {
    const [questionType, setQuestionType] = useState(-1);

    const questionTypeHandler = (type) => {
        setQuestionType(type)
    }

    return (
        <>
            {
                [questionType == 0 && (
                        <SkillInterview
                            questionTypeHandler={questionTypeHandler}
                        />
                ),
                questionType > 0 && (
                    <InterviewQuestions
                        questionTypeHandler={questionTypeHandler}
                        titleText={"인성면접"}
                    />
                ),
                questionType < 0 && (
                    <SelectQuestion
                        questionTypeHandler={questionTypeHandler}
                    />
                )]
            }
        </>
    );
}

export default Question;