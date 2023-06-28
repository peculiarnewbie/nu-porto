'use client'
import { stringify } from "querystring";
import { useState, useEffect } from "react"

export default function Video(){
    const [progress, setProgress] = useState(0)
    const [video, setVideo] = useState(null)
    const [paused, setPaused] = useState(false)

    let prog = 0

    useEffect(() => {
        const videoElement = document.getElementById('videoElement');
        setVideo(videoElement);
        const playimgs = setInterval( () => {
            if(paused){return}
            console.log('playing imgs')
            if(prog > 100){prog = 0}
            prog = prog + 10
            setProgress(prog)
            console.log(progress, prog)
            }, 50)
        return () => clearInterval(playimgs);

      }, [paused]);

    function handleLeave(e:any){
        setPaused(false)
        video.play()
    }

    function handleVideoSeeking(e:any){
        e.preventDefault()
        let position = e.pageX
        const progress = position / window.innerWidth * 100;
        video.currentTime = (8 / 100) * progress
        prog = progress
        video.pause()
        setPaused(true)
        setProgress(progress)
    }

    useEffect(() => {
        
    }, []);

    const imgArray = new Array(23).fill(0)

    return(
        <div >
            <h1 style={{position:'fixed', zIndex:'2'}}>HEELLOOOO</h1>
            <div style={{position:'absolute', width:'100vw', height:'50vh', opacity: '0.5', backgroundColor:'black'}}>
            </div>
            <div style={{display:'flex'}}>
                <video id="videoElement" src="/VideoTest/BCNRGlastonbury.mp4" autoPlay loop muted width="50%"></video>
                <div style={{width:'50%'}}>
                    {(imgArray.map((img, index) => {
                        return(
                            <img style={{width: '50%', 
                            visibility:`${Math.round(progress/10) == index ? 'visible' : 'hidden'}`,
                            position: 'absolute',
                        }} src={`/VideoTest/img sequence/webp/bcnr00${34+index*3}.webp`}></img>
                        )}
                    ))}
                </div>
            </div>
            <div style={{display:'flex', backgroundColor: 'gray', width:'100vw', height: '100vh'}} onMouseMove={handleVideoSeeking} onMouseLeave={handleLeave}>
                <p style={{color: 'black', height:'100%', zIndex:'5'}}> video progress: {progress}</p>
            </div>
        </div>
    )
}