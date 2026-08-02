import { LightningElement, api } from 'lwc';

export default class YoutubePlayer extends LightningElement {

    _videoId;

    @api
    get videoId() {
        return this._videoId;
    }

    set videoId(value) {
        this._videoId = value;
        this.updatePlayer();
    }

    renderedCallback() {
        this.updatePlayer();
    }

    updatePlayer() {

        if (!this._videoId) {
            return;
        }

        const iframe = this.template.querySelector('iframe');

        if (iframe) {
            iframe.src = `https://www.youtube.com/embed/${this._videoId}`;
        }
    }
}