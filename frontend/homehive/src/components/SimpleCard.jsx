import React from 'react';

function ModernCard({ title, content, imageUrl }) {
    return (
        <div className="max-w-sm rounded overflow-hidden shadow-lg hover:shadow-2xl transition-shadow duration-300 ease-in-out">
            <img className="w-full" src={imageUrl} alt="Card Image" />
            <div className="px-6 py-4">
                <div className="font-bold text-xl mb-2">{title}</div>
                <p className="text-gray-700 text-base">
                    {content}
                </p>
            </div>
            <div className="px-6 pt-4 pb-2">
                <button className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
                    Read More
                </button>
            </div>
        </div>
    );
}

export default ModernCard;
