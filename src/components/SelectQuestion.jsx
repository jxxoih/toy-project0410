const SelectQuestion = (props) => {
    const {questionTypeHandler} = props;

    return (
        <div className="questionContainer">
            <div className="questionItem">
                <button
                    onClick={() => questionTypeHandler(0)}
                >
                    기술면접
                </button>
            </div>
            <div className="questionItem">
                <button
                    onClick={() => questionTypeHandler(1)}
                >
                    인성면접
                </button>
            </div>
        </div>
    );
}

export default SelectQuestion;