const hud = document.getElementById('weapon-hud');
const weaponImage = document.getElementById('weapon-image');
const ammo = document.getElementById('ammo');
const ammoImage = document.getElementById('ammo-image');
const ammoCount = document.getElementById('ammo-count');

const FALLBACK_AMMO_IMAGE = 'images/ammo.png';

fetch(`https://${GetParentResourceName()}/ready`, {
    method: 'POST',
    headers: {
        'Content-Type': 'application/json; charset=UTF-8'
    },
    body: '{}'
}).catch(() => {});

function setImageSafely(imgEl, src, fallbackSrc) {
    if (imgEl.dataset.targetSrc === src) {
        return;
    }

    imgEl.dataset.targetSrc = src;
    imgEl.onerror = () => {
        if (fallbackSrc && imgEl.src.indexOf(fallbackSrc) === -1) {
            imgEl.onerror = null;
            imgEl.src = fallbackSrc;
        }
    };
    imgEl.src = src;
}

// ------------------------------------------------------------
// HUD position editing (drag to move)
// ------------------------------------------------------------

let editMode = false;
let dragging = false;
let dragOffsetX = 0;
let dragOffsetY = 0;

function applyPosition(position) {
    if (!position) {
        return;
    }

    const x = (position.xPercent / 100) * window.innerWidth;
    const y = (position.yPercent / 100) * window.innerHeight;

    hud.style.left = `${x}px`;
    hud.style.top = `${y}px`;
    hud.style.right = 'auto';
    hud.style.bottom = 'auto';
}

function savePosition() {
    const rect = hud.getBoundingClientRect();
    const position = {
        xPercent: (rect.left / window.innerWidth) * 100,
        yPercent: (rect.top / window.innerHeight) * 100
    };

    fetch(`https://${GetParentResourceName()}/saveHudPosition`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8'
        },
        body: JSON.stringify(position)
    }).catch(() => {});
}

function setEditMode(enabled) {
    editMode = enabled;
    hud.classList.toggle('edit-mode', enabled);

    if (enabled) {
        // Show a placeholder preview so there's always something to drag,
        // even with no weapon equipped.
        hud.classList.add('show');
        ammo.classList.remove('hidden');
        setImageSafely(weaponImage, 'images/weapons/weapon_revolver_cattleman.png', null);
        setImageSafely(ammoImage, 'images/ammo_revolver.png', FALLBACK_AMMO_IMAGE);
        ammoCount.textContent = '999';
    }
}

hud.addEventListener('mousedown', (event) => {
    if (!editMode) {
        return;
    }

    dragging = true;
    const rect = hud.getBoundingClientRect();
    dragOffsetX = event.clientX - rect.left;
    dragOffsetY = event.clientY - rect.top;
    hud.classList.add('dragging');
    event.preventDefault();
});

window.addEventListener('mousemove', (event) => {
    if (!dragging) {
        return;
    }

    const x = event.clientX - dragOffsetX;
    const y = event.clientY - dragOffsetY;

    hud.style.left = `${x}px`;
    hud.style.top = `${y}px`;
    hud.style.right = 'auto';
    hud.style.bottom = 'auto';
});

window.addEventListener('mouseup', () => {
    if (!dragging) {
        return;
    }

    dragging = false;
    hud.classList.remove('dragging');
    savePosition();
});

window.addEventListener('message', (event) => {
    const data = event.data;

    if (!data || !data.action) {
        return;
    }

    if (data.action === 'weaponHudEditMode') {
        setEditMode(data.enabled === true);
        return;
    }

    if (data.action === 'weaponHudPosition') {
        applyPosition(data.position);
        return;
    }

    if (data.action !== 'weaponHud') {
        return;
    }

    if (editMode) {
        // Ignore live weapon/ammo updates while the player is positioning the HUD.
        return;
    }

    if (!data.visible) {
        hud.classList.remove('show');
        return;
    }

    if (data.weaponImage) {
        setImageSafely(weaponImage, `images/weapons/${data.weaponImage}`, null);
    }

    setImageSafely(ammoImage, `images/${data.ammoImage || 'ammo.png'}`, FALLBACK_AMMO_IMAGE);

    ammoCount.textContent = String(data.ammo ?? 0);
    ammo.classList.toggle('hidden', !data.showAmmo);

    const ammoValue = Number(data.ammo ?? 0);
    ammo.classList.toggle('low-ammo', data.showAmmo && ammoValue > 0 && ammoValue <= 6);
    ammo.classList.toggle('zero-ammo', data.showAmmo && ammoValue <= 0);

    hud.classList.add('show');
});


window.addEventListener('keydown', (event) => {
    if (editMode && event.key === 'Escape') {
        event.preventDefault();
        fetch(`https://${GetParentResourceName()}/closeEditMode`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8'
            },
            body: '{}'
        }).catch(() => {});
    }
});