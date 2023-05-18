import React, { useState } from "react";
import t from '../../translation.json';
import srcURL from '../../srcURL.json';
import { Icon, Button, Image, Modal } from 'semantic-ui-react'
import axios from 'axios'

import 'semantic-ui-css/semantic.min.css'
import './identifyStyles.scss'



const Identify = () => {

    const [images, setImages] = useState([]);
    const [currentSelectedImage, setCurrentSelectedImage] = useState([]);
    const [statusButton, setStatusButton] = useState('active')
    const [showRemoveButton, setShowRemoveButton] = useState([]);
    const [selectedFile, setSelectedFile] = useState([])
    const [submit, setSubmit] = useState(false);
    const [resultIdentify, setResultIdentify] = useState([]);
    const [resultImage, setResultImage] = useState([]);
    const [fruitDetails, setFruitDetails] = useState([]);
    const [open, setOpen] = useState(false);

    const reader = new FileReader();

    let selectedImage = "";

    const handleFileSelect = (event) => {
        setSelectedFile(event.target.files[0]);
    };

    const handleUploadFilesToAPI = async () => {
        const formData = new FormData();
        formData.append('file', selectedFile)
        var data;
        await axios.post('http://localhost:8080/api/v1/agriculture-recognition/agriculture-recognition/recognition', formData)
            .then(async (res) => {
                data = res.data.result[0].common_name
                setResultIdentify(data)
                var imageData;
                var imageDetails;
                var fruit = data.split(':');
                await axios.get(`https://agriculture-identity.vercel.app/api/v1/agriculture/get-by-name/?name=${fruit[0]}`)
                    .then((res) => {
                        imageData = res.data[0].image;
                        imageDetails = res.data[0]
                    })
                setResultImage(imageData);
                setFruitDetails(imageDetails);
                if (res.status === 200) {
                    alert("Nhận diện thành công!");
                }
            });
    };

    // Handle upload image
    const handleImageUpload = (e) => {
        e.preventDefault()
        let file = e.target.files[0];
        reader.readAsDataURL(file);
        reader.onload = () => {
            setOpen(true)
            selectedImage = reader.result
            setCurrentSelectedImage(selectedImage)
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
                    setStatusButton('deactive');
                    // setSubmit(true);
                } else if (result.length === 0) {
                    setSubmit(false);
                } else if (result.length !== 0) {
                    setSubmit(true);
                }
                return result;
            });
        }
        handleFileSelect(e);
        e.target.value = null;
    }


    //Xu ly khi xoa 1 anh
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
            setResultImage([]);
            setFruitDetails([]);
            setResultIdentify([])
            if (result.length < 4) {
                setStatusButton('active');
                // setSubmit(false);
            } else if (result.length === 0) {
                setSubmit(false);
            }
            return result;
        });

    }

    const handleClickIdentify = (e) => {
        e.preventDefault();
        if (submit) {
            handleUploadFilesToAPI();
            // handleGetImageFromAPI();
        } else {
            alert('Chưa thể nhận diện!')
        }
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
                    <form className="identify__box__addimage--center" action='/identify' method="post" encType="multipart/form-data">
                        <input type="file" accept="image/*" onInput={(e) => handleImageUpload(e)} className="identify__box__addimage__input" id="__ADD__IMAGE" />
                        <label className={`identify__box__addimage__label ${statusButton || ''}`} htmlFor="__ADD__IMAGE">
                            <span>{`${statusButton === 'active' ? t["identify.label.addimage"] : "/"}`}</span>
                        </label>
                    </form>
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
                    <button onClick={(e) => handleClickIdentify(e)}>
                        <img src={srcURL.buttonLogo} height="20" alt="identify" />
                        Identify in
                    </button>
                </div>
            </div>
            <div className="result_box">
                <h2 className="result__title">Result</h2>
                <p>Nhận diện: {resultIdentify}</p>
                <div className="identify__box__showresult">
                    {resultImage && <img className="image" src={resultImage} alt="ResultImage" />}
                    <p>Mô tả: {fruitDetails.description}</p>
                </div>
            </div>
            <Modal
                open={open}
            >
                <Modal.Header>Choose an organ</Modal.Header>
                <Modal.Content image>
                    <Image size='medium' src={currentSelectedImage} wrapped />
                    <Modal.Actions>
                        <Button.Group basic vertical>
                            <Button>
                                <Image src='https://identify.plantnet.org/images/organs/flower.png' avatar />
                                Flower
                            </Button>
                            <Button>
                                <Image src='https://identify.plantnet.org/images/organs/leaf.png' avatar />
                                Leaf
                            </Button>
                            <Button>
                                <Image src='https://identify.plantnet.org/images/organs/fruit.png' avatar />
                                Fruit
                            </Button>
                            <Button>
                                <Image src='https://identify.plantnet.org/images/organs/bark.png' avatar />
                                Bark
                            </Button>
                        </Button.Group>
                    </Modal.Actions>
                </Modal.Content>
            </Modal>

        </div>

    )
}

export default Identify

