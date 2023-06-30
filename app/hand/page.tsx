"use client"
import { useEffect, useState } from "react"
import './handstyles.css'

export default function Hand(){

    const [progress, setProgress] = useState(0)

    const imgArray = new Array(40).fill(0)

    useEffect(() => {
        function calculateScroll(){
            let progress = (window.scrollY / 1000) * 39
            if(progress > 39){progress = 39}
            setProgress(progress)
        }

        function watchScroll(){
            window.addEventListener('scroll', calculateScroll)
        }

        watchScroll()
    }, [])

    return(
        <div className="HandRoot">
            <p style={{position:'fixed'}}>{progress}</p>
            <div className="HandContainer" style={{transform:`translateY(${-Math.round(progress*7)+150}px)`}}>

                {(imgArray.map((img, index) => {
                    return(
                        <div key={index} style={{width:'0', height:'0', 
                        visibility:`${Math.round(progress) == index ? 'visible' : 'hidden'}`}}>
                            <img className="HandImg" src={`/handshort/handshort_${String(index).padStart(3, '0')}.webp`}></img>
                        </div>
                    )}
                ))}
                <div className="HandBase" style={{transform:`translateY(${Math.round(progress*2)}px)`}}>

                </div>
                <div className="ExtraFists">
                    <img className="ExtraFistsimg" src="/Fist.png"
                        style={{transform:`translateY(${-Math.round(progress*3)+150}px)`}}
                    />
                </div>
            </div>
            <div style={{height:'1000px', width:'100vw'}}></div>
        </div>
    )
}