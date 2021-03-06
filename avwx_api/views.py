"""
Michael duPont - michael@mdupont.com
avwx_api.views - Routes and views for the Quart application
"""

# pylint: disable=W0702

# library
from quart import Response, jsonify, request

# module
from avwx_api import app

# Static Web Pages


@app.route("/weather/")
@app.route("/weather/home")
async def home() -> Response:
    """
    Returns static home page
    """
    return await app.send_static_file("html/home.html")


# API Routing Errors


@app.route("/weather/api")
async def no_report() -> Response:
    """
    Returns no report msg
    """
    return jsonify({"error": "No report type given"}), 400


@app.route("/weather/api/metar")
@app.route("/weather/api/taf")
async def no_station() -> Response:
    """
    Returns no station msg
    """
    return jsonify({"error": "No station given"}), 400
