import React from 'react'
import "./ItemStyles.scss"
import { Card } from 'semantic-ui-react';

const Item = ({ ...props }) => {

    const { name, notes, especes, images, description } = props;

    return (
        <div className='item'>
            <div className='image' style={{ backgroundImage: `url(${props.image})` }}></div>
            <div className='item_content'>
                <h3 className='name'>{name}</h3>
                <div className='notes'>{notes}</div>
                <div className='data'>
                    {/* <div className='especes'> <span className='numble'>{especes}</span><span>species</span></div>
                    <div className='images'> <span className='numble'>{images}</span><span>images</span></div> */}
                    {/* <span>{description}</span> */}
                    <Card.Content className='card_content'>
                        <Card.Description>{description}</Card.Description>
                    </Card.Content>
                </div>
            </div>
        </div>
    )
}

export default Item