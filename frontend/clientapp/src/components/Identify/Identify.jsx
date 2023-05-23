import React, { useEffect, useState } from "react";
import t from '../../translation.json';
import srcURL from '../../srcURL.json';
import { Icon, Button, Image, Modal } from 'semantic-ui-react'
import axios from 'axios'
import { classify } from "../../config/ClassifyImages";
import { resultDuplicate } from "../../config/ResultDuplicate"
import List from '../Product/ListProduct/ListProduct'


import 'semantic-ui-css/semantic.min.css'
import './identifyStyles.scss'



const Identify = () => {

    const [leafData, setLeafData] = useState([]);
    const [fruitData, setFruitData] = useState([]);

    useEffect(() => {
        const fetchLeafData = async () => {
            await axios.get(`${getAPIByType}6447dbeab556ff734098c72f`)
                .then((res) => {
                    setLeafData(res.data.agricultures);
                })
        }
        fetchLeafData();

        const fetchFruitData = async () => {
            await axios.get(`${getAPIByType}6447dbeab556ff734098c730`)
                .then((res) => {
                    setFruitData(res.data.agricultures);
                })
        }
        fetchFruitData();
    }, [])

    const [images, setImages] = useState([]);
    const [classifyImages, setClassifyImages] = useState([]);
    const [classifySticker, setClassifySticker] = useState([]);

    const [currentSelectedImage, setCurrentSelectedImage] = useState([]);
    const [statusButton, setStatusButton] = useState('active')
    const [showRemoveButton, setShowRemoveButton] = useState([]);
    const [selectedFile, setSelectedFile] = useState([])
    const [submit, setSubmit] = useState(false);
    const [resultIdentify, setResultIdentify] = useState([]);
    const [percentIdentify, setPercentIdentify] = useState([]);
    const [resultImage, setResultImage] = useState([]);
    const [fruitDetails, setFruitDetails] = useState([]);
    const [open, setOpen] = useState(false);
    const [leafFile, setLeafFile] = useState([]);
    const [flowerFile, setFlowerFile] = useState([]);
    const [barkFile, setBarkFile] = useState([]);
    const [fruitFile, setFruitFile] = useState([])

    const api = 'http://localhost:8080/api/v1/agriculture-recognition/agriculture-recognition/multi-recognition'
    const getAPIByType = 'https://agriculture-identity.vercel.app/api/v1/agriculture/type-id/'
    const reader = new FileReader();

    let selectedImage = "";


    const handleFileSelect = (event) => {
        setSelectedFile(event.target.files[0]);
    };

    const handleUploadFilesToAPI = async () => {
        var formDataIdentify = new FormData();
        formDataIdentify.append("leaf", leafFile);
        formDataIdentify.append("flower", flowerFile);
        formDataIdentify.append("bark", barkFile);
        formDataIdentify.append("fruit", fruitFile);

        for (var key of formDataIdentify.entries()) {
            console.log(key);
        }
        var nameIdentify1;
        var nameIdentify2;
        var nameIdentify3;
        var percent1;
        var percent2;
        var percent3;
        var imageData;
        var imageDetails1;
        var imageDetails2;
        var imageDetails3;

        await axios.post(api, formDataIdentify)
            .then(async (res) => {
                console.log("res0", res);
                let dataArray = resultDuplicate(res.data.results)
                if (dataArray[0]) {
                    nameIdentify1 = dataArray[0].common_name;
                    percent1 = (dataArray[0].percent).toFixed(2);
                }
                if (dataArray[1]) {
                    nameIdentify2 = dataArray[1].common_name;
                    percent2 = (dataArray[1].percent).toFixed(2);
                }
                if (dataArray[2]) {
                    nameIdentify3 = dataArray[2].common_name;
                    percent3 = (dataArray[2].percent).toFixed(2);
                }
                await axios.get(`https://agriculture-identity.vercel.app/api/v1/agriculture/get-by-name/?name=${nameIdentify1}`)
                    .then(async (res) => {
                        console.log("res1", res);
                        imageData = res.data.agriculture[0].image;
                        imageDetails1 = res.data.agriculture[0].description;
                        setResultImage(prevImages => {
                            let result = [...prevImages];
                            result.push(imageData);
                            return result;
                        })
                    });
                nameIdentify2 && await axios.get(`https://agriculture-identity.vercel.app/api/v1/agriculture/get-by-name/?name=${nameIdentify2}`)
                    .then(async (res) => {
                        imageData = res.data.agriculture[0].image;
                        imageDetails2 = res.data.agriculture[0].description;
                        setResultImage(prevImages => {
                            let result = [...prevImages];
                            result.push(imageData);
                            return result;
                        })
                    });
                nameIdentify3 && await axios.get(`https://agriculture-identity.vercel.app/api/v1/agriculture/get-by-name/?name=${nameIdentify3}`)
                    .then(async (res) => {
                        console.log(res);
                        imageData = res.data.agriculture[0].image;
                        imageDetails3 = res.data.agriculture[0].description;
                        setResultImage(prevImages => {
                            let result = [...prevImages];
                            result.push(imageData);
                            return result;
                        })
                    });

                setResultIdentify(prevNames => {
                    let result = [...prevNames];
                    result.push(nameIdentify1);
                    result.push(nameIdentify2);
                    if (nameIdentify3) {
                        result.push(nameIdentify3);
                    }

                    return result
                })
                setPercentIdentify(prevPercents => {
                    let result = [...prevPercents];
                    result.push(percent1);
                    result.push(percent2);
                    result.push(percent3);
                    console.log(result);
                    return result
                })
                setFruitDetails(prevDetails => {
                    let result = [...prevDetails];
                    result.push(imageDetails1);
                    result.push(imageDetails2);
                    if (imageDetails3) {
                        result.push(imageDetails3);
                    }

                    return result
                });
                if (res.status === 200) {
                    alert("Nhận diện thành công!");
                }
            })
        // .catch((err) => {
        //     if (err.response.status === 422) {
        //         alert("Vui lòng chọn đủ các bộ phận của cây!")
        //     };
        // })
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
                } else if (result.length >= 1) {
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
            }
            if (result.length === 0) {
                setSubmit(false)
            }
            return result;
        });

        setClassifyImages(prevClassifyImages => {
            let result = [...prevClassifyImages]
            result.splice(index, 1)
            return result;
        });

        setClassifySticker(prevStickers => {
            let result = [...prevStickers];
            var category = result[index];
            if (category === 'leaf') {
                result.splice(index, 1)
                setLeafFile([]);
            } if (category === 'flower') {
                result.splice(index, 1)
                setFlowerFile([])
            } if (category === 'bark') {
                result.splice(index, 1)
                setBarkFile([])
            } if (category === 'fruit') {
                result.splice(index, 1)
                setFruitFile([])
            }
            return result
        })
    }

    const handleClickIdentify = (e) => {
        e.preventDefault();
        setPercentIdentify([]);
        setResultIdentify([]);
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
                setLeafFile(selectedFile);
                setOpen(false);
                setClassifyImages(prevClassify => {
                    let result = [...prevClassify]
                    result.push(classify.leaf)
                    return result;
                });
                setClassifySticker(prevStickers => {
                    let result = [...prevStickers];
                    result.push('leaf');
                    return result
                })
                break;
            case 'flower':
                setFlowerFile(selectedFile);
                setOpen(false);
                setClassifyImages(prevClassify => {
                    let result = [...prevClassify]
                    result.push(classify.flower)
                    return result;
                });
                setClassifySticker(prevStickers => {
                    let result = [...prevStickers];
                    result.push('flower');
                    return result
                })
                break;
            case 'bark':
                setBarkFile(selectedFile);
                setOpen(false);
                setClassifyImages(prevClassify => {
                    let result = [...prevClassify]
                    result.push(classify.bark)
                    return result;
                });
                setClassifySticker(prevStickers => {
                    let result = [...prevStickers];
                    result.push('bark');
                    return result
                })
                break;
            case 'fruit':
                setFruitFile(selectedFile);
                setOpen(false);
                setClassifyImages(prevClassify => {
                    let result = [...prevClassify]
                    result.push(classify.fruit)
                    return result;
                });
                setClassifySticker(prevStickers => {
                    let result = [...prevStickers];
                    result.push('fruit');
                    return result
                })
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
                        {classifyImages[0] && <img className="classifyImage" alt="" src={classifyImages[0]} />}
                    </div>
                    <div className="identify__box__showimage__card">
                        {images[1] && <img src={images[1]} alt="selectedImage" />}
                        <button onClick={(e) => handleRemoveImage(e, 1)} className={`identify__box__showimage__card__removebutton ${showRemoveButton[1] || "noshow"}`}>
                            <Icon name="x" />
                        </button>
                        {classifyImages[1] && <img className="classifyImage" alt="" src={classifyImages[1]} />}
                    </div>
                </div>
                <div className="identify__box__showimage">
                    <div className="identify__box__showimage__card">
                        {images[2] && <img src={images[2]} alt="selectedImage" />}
                        <button onClick={(e) => handleRemoveImage(e, 2)} className={`identify__box__showimage__card__removebutton ${showRemoveButton[2] || "noshow"}`}>
                            <Icon name="x" />
                        </button>
                        {classifyImages[2] && <img className="classifyImage" alt="" src={classifyImages[2]} />}
                    </div>
                    <div className="identify__box__showimage__card">
                        {images[3] && <img src={images[3]} alt="selectedImage" />}
                        <button onClick={(e) => handleRemoveImage(e, 3)} className={`identify__box__showimage__card__removebutton ${showRemoveButton[3] || "noshow"}`}>
                            <Icon name="x" />
                        </button>
                        {classifyImages[3] && <img className="classifyImage" alt="" src={classifyImages[3]} />}
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
                <div className="result_box_card">
                    {resultIdentify[0] && <p><b>Nhận diện:</b> {resultIdentify[0]} - <b>Tỷ lệ: </b> {percentIdentify[0]} %</p>}
                    <div className="identify__box__showresult">
                        {resultImage[0] && <img className="image" src={resultImage[0]} alt="ResultImage" />}
                        {fruitDetails[0] && <p><b>Mô tả:</b> {fruitDetails[0]}</p>}
                    </div>
                </div>
                <div className="result_box_card">
                    {resultIdentify[1] && <p><b>Nhận diện:</b>  {resultIdentify[1]} - <b>Tỷ lệ: </b> {percentIdentify[1]} %</p>}
                    <div className="identify__box__showresult">
                        {resultImage[1] && <img className="image" src={resultImage[1]} alt="ResultImage" />}
                        {fruitDetails[1] && <p><b>Mô tả:</b> {fruitDetails[1]}</p>}
                    </div>
                </div>
                <div className="result_box_card">
                    {resultIdentify[2] && <p><b>Nhận diện:</b>  {resultIdentify[2]} - <b>Tỷ lệ: </b> {percentIdentify[2]} %</p>}
                    <div className="identify__box__showresult">
                        {resultImage[2] && <img className="image" src={resultImage[2]} alt="ResultImage" />}
                        {fruitDetails[2] && <p><b>Mô tả:</b> {fruitDetails[2]}</p>}
                    </div>
                </div>
            </div>
            <div className="plant_list">
                <h2 className="plant_list_title">Plant list</h2>
                <div>
                    <ul>
                        {fruitData &&
                            <List plants={fruitData} />
                        }
                        {leafData &&
                            <List plants={leafData} />
                        }
                    </ul>
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

