import React, { useState } from "react";
import t from '../../translation.json';
import srcURL from '../../srcURL.json'

import './identifyStyles.scss'

const Identify = () => {

    const [images, setImages] = useState([]);

    const reader = new FileReader();

    let selectedImage = 'anh dang chon'
    console.log(selectedImage);

    const handleImageUpload = (e) => {
        let file = e.target.files[0];
        reader.readAsDataURL(file);
        console.log('vo roi ne');
        reader.onload = () => {
            selectedImage = reader.result
            setImages(prevImages => {
                let result = [...prevImages]
                if (prevImages.includes(selectedImage)) {
                    alert('The same image cannot be added twice');
                } else {
                    result.push(selectedImage);
                }
                return result;
            });
        }
        e.target.value = null;
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
                        <label className="identify__box__addimage__label" htmlFor="__ADD__IMAGE">
                            <span>{t["identify.label.addimage"]}</span>
                        </label>
                    </div>
                </div>
                <div className="identify__box__showimage">
                    <div className="identify__box__showimage__card">
                        {images[0] && <img src={images[0]} alt="selectedImage" />}
                    </div>
                    <div className="identify__box__showimage__card">
                        {images[1] && <img src={images[1]} alt="selectedImage" />}
                    </div>
                </div>
                <div className="identify__box__showimage">
                    <div className="identify__box__showimage__card">
                        {images[2] && <img src={images[2]} alt="selectedImage" />}
                    </div>
                    <div className="identify__box__showimage__card">
                        {images[3] && <img src={images[3]} alt="selectedImage" />}
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

