import React from 'react'
import "./ListProductStyles.scss"
import Item from '../Item/Item';

const ListProduct = ({ ...props }) => {
    var id = 1;
    const { plants } = props
    return (
        <div className='list'>
            <ul className='listproduct'>
                {
                    plants &&
                    plants.map((i) => (
                        <li key={id++} className='items'>
                            <Item name={i.common_name} notes={i.specific_name} image={i.image} description={i.description} />
                            {/* especes={i.especes} images={i.images} */}
                        </li>
                    ))
                }
            </ul>
        </div>
    )
}

export default ListProduct