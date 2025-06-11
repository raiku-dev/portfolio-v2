import React, { useState, useEffect, useRef, useCallback } from 'react';
import logo from '../assets/images/pfp-small.webp';
import './Header.scss';

export default function Header() {
	const [innerWidth, setInnerWidth] = useState(window.innerWidth);

	const [open, setOpen] = useState(false);

	const lastWidthRef = useRef(0);

	const breakpoint = 840;

	const toggleMenu = useCallback(() => {
		setOpen((prevOpen) => !prevOpen);
	}, []);

	useEffect(() => {
		if (open && innerWidth <= breakpoint) {
			document.body.style.overflow = 'hidden';
		} else {
			document.body.style.overflow = 'auto';
		}
	}, [open, innerWidth]);


	useEffect(() => {
		const onResize = () => {
			const newWidth = window.innerWidth;
			setInnerWidth(newWidth);

			if (!open || newWidth > breakpoint) return;
			if (lastWidthRef.current !== newWidth) {
				setOpen(false);
				lastWidthRef.current = newWidth;
			}
		};

		window.addEventListener('resize', onResize);

		return () => {
			window.removeEventListener('resize', onResize);
		};
	}, [open, breakpoint]);

	return (
		<header id="header">
			<a href="/" className="logo-container">
				<img src={logo.src} alt="Mikayil's alias raiku" />
			</a>
			<nav
				id="main-nav"
				aria-label="Main"
				hidden={innerWidth <= breakpoint && !open}
			>
				<a href="/" title="To homepage">Home</a>
				<a href="/blog" title="To my developer blog">Blog</a>
				<a href="/#about" title="To the about section">About</a>
				<a href="/#projects" title="To the projects section">Projects</a>
				<a href="/#contact" title="To the contact section">Contact</a>
			</nav>
			<button
				className="mbt"
				aria-controls="main-nav"
				aria-label="Open Main Menu"
				aria-expanded={open}
				onClick={toggleMenu}
			>
				<span className="dot" aria-hidden="true"></span>
				<span className="dot" aria-hidden="true"></span>
				<span className="dot" aria-hidden="true"></span>
				<span className="dot" aria-hidden="true"></span>
				<span className="dot" aria-hidden="true"></span>
				<span className="dot" aria-hidden="true"></span>
				<span className="dot" aria-hidden="true"></span>
				<span className="dot" aria-hidden="true"></span>
				<span className="dot" aria-hidden="true"></span>
			</button>
		</header>
	);
}
