import redirect from './redirect';

document.querySelector<HTMLDivElement>('#app')!.innerHTML = `<h1>KTolliver - Github - Home</h1>`;

redirect(`https://github.com/kctolli`, 0.25);
