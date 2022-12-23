const redirect = (link : string, delaymultiplier : number = 1) => {
    setTimeout(function() {
        //window.alert(`Redirecting to ${link}`);
        window.location.href = link;
    }, 1000 /* 1 second */ * delaymultiplier);
}

export default redirect;
