import { useEffect } from "react";
import { useState } from "react";
import "styles/language.css";

const SelectLanguage = (props) => {
    const { questionTypeHandler, languageTypeHandler, skillLanguageData } = props;

    const [languageData, setLanguageData] = useState([]);

    useEffect(() => {
        setLanguageData(skillLanguageData);
    }, [skillLanguageData]);

    return (
        <div className="languageContainer">
            <div className="languageArea">
                <div className="languageWrap">
                    {
                        !!languageData &&
                        languageData.map((item, idx) => (
                            <div
                                className="languageItem"
                                onClick={() => languageTypeHandler(idx)}
                            >
                                {item.l_text}
                            </div>
                        ))
                    }
                </div>
                <div className="selectBtn">
                    <button
                        onClick={() => questionTypeHandler(-1)}
                    >
                        목록
                    </button>
                </div>
            </div>
        </div>
    );
}

export default SelectLanguage;