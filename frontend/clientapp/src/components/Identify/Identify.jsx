import React, { useState } from "react";
import t from '../../translation.json';
import srcURL from '../../srcURL.json';
import { Icon, Button, Image, Modal } from 'semantic-ui-react'
import axios from 'axios'
import { classify } from "../../config/ClassifyImages";

import 'semantic-ui-css/semantic.min.css'
import './identifyStyles.scss'



const Identify = () => {

    const [images, setImages] = useState([]);
    const [classifyImages, setClassifyImages] = useState([]);

    const [currentSelectedImage, setCurrentSelectedImage] = useState([]);
    const [statusButton, setStatusButton] = useState('active')
    const [showRemoveButton, setShowRemoveButton] = useState([]);
    const [selectedFile, setSelectedFile] = useState([])
    const [submit, setSubmit] = useState(false);
    const [resultIdentify, setResultIdentify] = useState([]);
    const [resultImage, setResultImage] = useState([]);
    const [fruitDetails, setFruitDetails] = useState([]);
    const [open, setOpen] = useState(false);

    let leafFile = [];
    let flowerFile = [];
    let barkFile = [];
    let fruitFile = [];

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
            selectedImage = reader.result
            setCurrentSelectedImage(selectedImage)
            setImages(prevImages => {
                let result = [...prevImages]
                if (prevImages.includes(selectedImage)) {
                    alert('The same image cannot be added twice');
                } else {
                    setOpen(true)
                    result.push(selectedImage);
                    setShowRemoveButton(prevStatusButton => {
                        let statusResult = [...prevStatusButton]
                        statusResult.push(`show${result.length}`)
                        return statusResult;
                    });
                }
                if (result.length === 4) {
                    setStatusButton('deactive');
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
        setClassifyImages(prevClassifyImages => {
            let result = [...prevClassifyImages]
            result.splice(index, 1)
            return result;
        })
    }

    const handleClickIdentify = (e) => {
        e.preventDefault();
        if (submit) {
            handleUploadFilesToAPI();
        } else {
            alert('Chưa thể nhận diện!')
        }
    }

    const handleClassifyImage = (e, type) => {
        e.preventDefault();
        switch (type) {
            case 'leaf':
                leafFile.splice(0, 1, selectedFile)
                setOpen(false);
                setClassifyImages(prevClassify => {
                    let result = [...prevClassify]
                    result.push(classify.leaf)
                    return result;
                });
                break;
            case 'flower':
                flowerFile.splice(0, 1, selectedFile)
                setOpen(false);
                setClassifyImages(prevClassify => {
                    let result = [...prevClassify]
                    result.push(classify.flower)
                    return result;
                });
                break;
            case 'bark':
                barkFile.splice(0, 1, selectedFile)
                setOpen(false);
                setClassifyImages(prevClassify => {
                    let result = [...prevClassify]
                    result.push(classify.bark)
                    return result;
                });
                break;
            case 'fruit':
                fruitFile.splice(0, 1, selectedFile)
                setOpen(false);
                setClassifyImages(prevClassify => {
                    let result = [...prevClassify]
                    result.push(classify.fruit)
                    return result;
                });
                break;
            default:
                console.log("No value found");
        }
    }

    return (
        <div className="identify">
            <h2 className="identify__venture">
                <span className="identify__venture__title">{t.groupName}</span>
                <span className="identify__venture__description">{t["home.description"]}</span>
            </h2>
            <h3 className="des">
                <p className="des__title">Identify, explore and share your observations of wild plants</p>
                <p className="des__content"><span>Application of plant identification</span> is a tool to help to identify plants with pictures. It is organized in different thematic and geographical floras.</p>
            </h3>
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
                        {classifyImages[0] && <img className="classifyImage" src={classifyImages[0]} />}
                    </div>
                    <div className="identify__box__showimage__card">
                        {images[1] && <img src={images[1]} alt="selectedImage" />}
                        <button onClick={(e) => handleRemoveImage(e, 1)} className={`identify__box__showimage__card__removebutton ${showRemoveButton[1] || "noshow"}`}>
                            <Icon name="x" />
                        </button>
                        {classifyImages[1] && <img className="classifyImage" src={classifyImages[1]} />}
                    </div>
                </div>
                <div className="identify__box__showimage">
                    <div className="identify__box__showimage__card">
                        {images[2] && <img src={images[2]} alt="selectedImage" />}
                        <button onClick={(e) => handleRemoveImage(e, 2)} className={`identify__box__showimage__card__removebutton ${showRemoveButton[2] || "noshow"}`}>
                            <Icon name="x" />
                        </button>
                        {classifyImages[2] && <img className="classifyImage" src={classifyImages[2]} />}
                    </div>
                    <div className="identify__box__showimage__card">
                        {images[3] && <img src={images[3]} alt="selectedImage" />}
                        <button onClick={(e) => handleRemoveImage(e, 3)} className={`identify__box__showimage__card__removebutton ${showRemoveButton[3] || "noshow"}`}>
                            <Icon name="x" />
                        </button>
                        {classifyImages[3] && <img className="classifyImage" src={classifyImages[3]} />}
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
                            <Button
                                onClick={(e) => handleClassifyImage(e, 'flower')}>
                                <Image src={classify.flower} avatar />
                                Flower
                            </Button>
                            <Button
                                onClick={(e) => handleClassifyImage(e, 'leaf')}>
                                <Image src={classify.leaf} avatar />
                                Leaf
                            </Button>
                            <Button
                                onClick={(e) => handleClassifyImage(e, 'fruit')}>
                                <Image src={classify.fruit} avatar />
                                Fruit
                            </Button>
                            <Button
                                onClick={(e) => handleClassifyImage(e, 'bark')}>
                                <Image src={classify.bark} avatar />
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

