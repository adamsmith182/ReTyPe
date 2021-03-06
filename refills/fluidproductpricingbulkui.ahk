/**
 * File containing Refill class to add text-searching for access codes to components
 * Class will add itself to the parent retype instance
 *
 * AutoHotKey v1.1.13.01+
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 * 
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * @category	Automation
 * @package		ReTyPe
 * @author		Dominic Wrapson <hwulex[åt]gmail[dõt]com>
 * @copyright	2014 Dominic Wrapson
 * @license		GNU AFFERO GENERAL PUBLIC LICENSE Version 3, 19 November 2007 http://www.gnu.org/licenses/
 */


; Trigger my damn self (in a horrible way due to AHK limitations)
objRetype.refill( new FluidProductPricingBulkUI() )

/**
 * Refill that resizes combo-box in bulk pricing window to make pricing seasons legible
 *
 * @category	Automation
 * @package		ReTyPe
 * @author		Dominic Wrapson <hwulex[åt]gmail[dõt]com>
 * @copyright	2014 Dominic Wrapson
 */
class FluidProductPricingBulkUI extends Fluid {

	static intTimer	:= 500

	/**
	 * Setup controls, window group, etc
	 */
	__New() {
		global objRetype
		base.__New()

		strRTP		:= % objRetype.objRTP.classNN()
		strGroup	:= this.id
		GroupAdd, %strGroup%, Product Header Pricing Bulk Update ahk_class %strRTP%, Selected Price Update Details
	}

	/**
	 * Triggered when appropriate window conditions met
	 */
	pour() {
		global objRetype

		strGroup := this.__Class
		IfWinActive, ahk_group %strGroup%
		{
			; BULK PRICING:	Resize the pricing season drop-down
			strControl := objRetype.objRTP.formatClassNN( "COMBOBOX", this.getConf( "ComboBox", 11 ) )
			ControlMove, %strControl%, , , 400, , A

			; Resize window
			WinGetPos, intX, intY, intW, intH, A
			if ( intW = 618 || intW = 610 )
			{
				WinMove, A, , % intX-150, , 950
			}
		}
	}

}