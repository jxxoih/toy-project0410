import { useEffect } from "react";
import { useState } from "react";
import InterviewQuestions from "./InterviewQuestions";
import SelectLanguage from "./SelectLanguage";

const languageDummyData = [
    {
        l_id : 1,
        l_text: "기술전체",
        l_type: 0
    },
    {
        l_id : 2,
        l_text: "JAVA / Spring",
        l_type: 1
    },
    {
        l_id : 3,
        l_text: "PHP" ,
        l_type: 2
    },
    {
        l_id : 4,
        l_text: "React / Front",
        l_type: 3
    }
];

const SkillInterview = (props) => {
    const { questionTypeHandler } = props;

    const [languageType, setLanguageType] = useState(-1);
    const [languageData, setLanguageData] = useState([]);
    const [languageText, setLanguageText] = useState(null);

    const languageTypeHandler = (arg) => {
        setLanguageType(arg);
        setLanguageText(languageData[arg]?.l_text);
    }

    useEffect(() => {
        setLanguageData(languageDummyData)
    }, []);

    return (
        <>
            {
                [
                    languageType < 0 && (
                        <SelectLanguage
                            questionTypeHandler={questionTypeHandler}
                            languageTypeHandler={languageTypeHandler}
                            skillLanguageData={languageData}
                        />
                    ),
                    languageType >= 0 && (
                        <InterviewQuestions
                            questionTypeHandler={languageTypeHandler}
                            titleText={languageText}
                        />
                    )
                ]
            }

        </>
    );
}

export default SkillInterview;