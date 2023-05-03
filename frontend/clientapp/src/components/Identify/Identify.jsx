import React, { useState } from "react";
import t from '../../translation.json';
import srcURL from '../../srcURL.json';
import { Icon } from 'semantic-ui-react'

import 'semantic-ui-css/semantic.min.css'
import './identifyStyles.scss'



const Identify = () => {

    const [images, setImages] = useState([]);
    const [statusButton, setStatusButton] = useState('active')
    const [showRemoveButton, setShowRemoveButton] = useState([]);

    const reader = new FileReader();

    let selectedImage = "";


    // Handle upload image
    const handleImageUpload = (e) => {
        e.preventDefault()
        let file = e.target.files[0];
        reader.readAsDataURL(file);
        reader.onload = () => {
            selectedImage = reader.result
            setImages(prevImages => {
                let result = [...prevImages]
                if (prevImages.includes(selectedImage)) {
                    alert('The same image cannot be added twice');
                } else {
                    result.push(selectedImage);
                    setShowRemoveButton(prevStatusButton => {
                        let statusResult = [...prevStatusButton]
                        statusResult.push(`show${result.length}`)
                        return statusResult;
                    });
                }
                if (result.length === 4) {
                    setStatusButton('deactive')
                }
                return result;
            });
        }
        e.target.value = null;
    }

    const handleRemoveImage = (e, index) => {
        e.preventDefault()
        setImages(prevImages => {
            let result = [...prevImages]
            result.splice(index, 1)
            setShowRemoveButton(prevStatusButton => {
                let statusResult = [...prevStatusButton]
                statusResult.splice(index, 1);
                return statusResult;
            });
            return result;
        });
    }

    return (
        <div className="identify">
            <h2 className="identify__venture">
                <span className="identify__venture__title">{t.groupName}</span>
                <span className="identify__venture__description">{t["home.description"]}</span>
            </h2>
            <div className="identify__box">
                <h2 className="identify__box__title">{t["identify.title"]}</h2>
                <p className="identify__box__subtitle" style={{ fontWeight: "bold" }}>{t["identify.subtitle"]} {t.groupName}</p>
                <p className="identify__box__manual">{t["identify.manual"]}<br />{t["identify.manual.line2"]}<br />{t["identify.manual3.line3"]}</p>
                <div className="identify__box__addimage">
                    <div className="identify__box__addimage--center">
                        <input type="file" accept="image/*" onInput={(e) => handleImageUpload(e)} className="identify__box__addimage__input" id="__ADD__IMAGE" />
                        <label className={`identify__box__addimage__label ${statusButton || ''}`} htmlFor="__ADD__IMAGE">
                            <span>{t["identify.label.addimage"]}</span>
                        </label>
                    </div>
                </div>
                <div className="identify__box__showimage">
                    <div className="identify__box__showimage__card">
                        {images[0] && <img src={images[0]} alt="selectedImage" />}
                        <button onClick={(e) => handleRemoveImage(e, 0)} className={`identify__box__showimage__card__removebutton ${showRemoveButton[0] || "noshow"}`}>
                            <Icon name="x" />
                        </button>
                    </div>
                    <div className="identify__box__showimage__card">
                        {images[1] && <img src={images[1]} alt="selectedImage" />}
                        <button onClick={(e) => handleRemoveImage(e, 1)} className={`identify__box__showimage__card__removebutton ${showRemoveButton[1] || "noshow"}`}>
                            <Icon name="x" />
                        </button>
                    </div>
                </div>
                <div className="identify__box__showimage">
                    <div className="identify__box__showimage__card">
                        {images[2] && <img src={images[2]} alt="selectedImage" />}
                        <button onClick={(e) => handleRemoveImage(e, 2)} className={`identify__box__showimage__card__removebutton ${showRemoveButton[2] || "noshow"}`}>
                            <Icon name="x" />
                        </button>
                    </div>
                    <div className="identify__box__showimage__card">
                        {images[3] && <img src={images[3]} alt="selectedImage" />}
                        <button onClick={(e) => handleRemoveImage(e, 3)} className={`identify__box__showimage__card__removebutton ${showRemoveButton[3] || "noshow"}`}>
                            <Icon name="x" />
                        </button>
                    </div>
                </div>
                <div className="identify__box__button">
                    <button>
                        <img src={srcURL.buttonLogo} height="20" alt="identify" />
                        Identify in
                    </button>
                </div>
            </div>
        </div>
    )
}

export default Identify

