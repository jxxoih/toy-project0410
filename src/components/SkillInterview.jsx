import { useEffect } from "react";
import { useState } from "react";
import InterviewQuestions from "components/InterviewQuestions";
import SelectLanguage from "components/SelectLanguage";
import * as appUtil from "util/appUtil.js";


const SkillInterview = (props) => {
    const { questionTypeHandler } = props;

    const [languageType, setLanguageType] = useState(-1);
    const [languageData, setLanguageData] = useState([]);
    const [languageText, setLanguageText] = useState(null);

    const languageTypeHandler = (arg) => {

        if(arg >= 0) {
            setLanguageType(languageData[arg]?.l_type);
            setLanguageText(languageData[arg]?.l_text);
        } else {
            resetHandler();
        }
    }

    const resetHandler = () => {
        setLanguageType(-1);
        setLanguageText(null);
    }

    const getLanguage = async () => {
        let result = await appUtil.getRequest("language", null);
        setLanguageData(result);
    }

    useEffect(() => {
        getLanguage();
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
                            languageType={languageType}
                        />
                    )
                ]
            }

        </>
    );
}

export default SkillInterview;