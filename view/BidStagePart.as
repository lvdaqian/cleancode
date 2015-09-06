//Created by Action Script Viewer - http://www.buraks.com/asv
package view
{
    import flash.display.Sprite;
    import ws.BidStage;
    import model.LogApplication;
    import zebra.Game;
    import flash.events.MouseEvent;
    import event.InfoTagEvent;
    import flash.utils.setTimeout;

    public class BidStagePart extends Sprite 
    {

        public var bidstage:BidStage;
        public var bidcode:Number;
        private var lowestValue:int = 0;
        private var flag:String = "";
        public var canClick:Boolean = true;
        public var logappliction:LogApplication;

        public function BidStagePart()
        {
            this.logappliction = new LogApplication();
            super();
            Game.Content.addUpdateView(this);
            this.x = 403.45;
            this.bidstage = new BidStage();
            this.bidstage.price2.visible = false;
            this.bidstage.price1.visible = false;
            this.bidstage.ver.text = Main.clientui_version;
            this.bidstage.ver.addEventListener(MouseEvent.CLICK, this.OpenLog);
            addChild(this.bidstage);
            this.bidstage.price2.visible = true;
            this.bidstage.price1.visible = false;
            Game.DirectEvent.receive(InfoTagEvent.name, function (e:InfoTagEvent):void
            {
                if (e.tag == "B")
                {
                    bidstage.price1.visible = true;
                    lowestValue = e.value;
                    bidstage.price1.priceInfoTxt.text = (("目前最低可成交价 : " + e.value) + "元");
                    bidstage.price2.visible = false;
                    bidcode = 2;
                }
                else
                {
                    if (e.tag == "A")
                    {
                        bidstage.price2.visible = true;
                        bidstage.price1.visible = false;
                        bidcode = 1;
                    }
                    else
                    {
                        if (e.tag == "C")
                        {
                            bidstage.price2.visible = true;
                            bidstage.price1.visible = false;
                            bidcode = 3;
                        }
                        else
                        {
                            bidcode = 4;
                        };
                    };
                };
                if (e.tag == "A")
                {
                    bidstage.price1.priceInfoTxt.visible = false;
                }
                else
                {
                    bidstage.price1.priceInfoTxt.visible = true;
                };
            });
            this.bidstage.price1.i100.addEventListener(MouseEvent.CLICK, this._butHandler);
            this.bidstage.price1.i200.addEventListener(MouseEvent.CLICK, this._butHandler);
            this.bidstage.price1.i300.addEventListener(MouseEvent.CLICK, this._butHandler);
            this.bidstage.price1.s100.addEventListener(MouseEvent.CLICK, this._butHandler);
            this.bidstage.price1.s200.addEventListener(MouseEvent.CLICK, this._butHandler);
            this.bidstage.price1.s300.addEventListener(MouseEvent.CLICK, this._butHandler);
            this.bidstage.price1.priceBut.addEventListener(MouseEvent.CLICK, this._butHandler);
            this.bidstage.price1.priceInputTxt.restrict = "0-9";
            this.bidstage.price2.priceInputTxt1.restrict = "0-9";
            this.bidstage.price2.priceInputTxt2.restrict = "0-9";
            this.bidstage.price2.priceInputTxt1.tabIndex = 1;
            this.bidstage.price2.priceInputTxt2.tabIndex = 2;
            this.bidstage.price2.priceBut2.addEventListener(MouseEvent.CLICK, this._butHandler);
            this.bidstage.queryInfoBut.addEventListener(MouseEvent.CLICK, this.getSelfPriceInfoHandler);
        }

        public function OpenLog(e:MouseEvent):void
        {
            LogWinPart(Game.Content.getView(LogWinPart)).show();
        }

        public function getSelfPriceInfoHandler(e:MouseEvent):void
        {
            var win:SelfTopPriceWindowPart;
            setTimeout(this.clickCount, (1000 * 6));
            if (this.canClick)
            {
                win = new SelfTopPriceWindowPart();
                BidInitView.setWin(win);
                this.canClick = false;
            };
        }

        private function clickCount():void
        {
            this.canClick = true;
        }

        public function _butHandler(e:MouseEvent):void
        {
            var _local_2:WarnInfoPart;
            switch (e.target.name)
            {
                case "s300":
                    this.bidstage.price1.priceInputTxt.text = String((this.lowestValue - 300));
                    break;
                case "s200":
                    this.bidstage.price1.priceInputTxt.text = String((this.lowestValue - 200));
                    break;
                case "s100":
                    this.bidstage.price1.priceInputTxt.text = String((this.lowestValue - 100));
                    break;
                case "i300":
                    this.bidstage.price1.priceInputTxt.text = String((this.lowestValue + 300));
                    break;
                case "i200":
                    this.bidstage.price1.priceInputTxt.text = String((this.lowestValue + 200));
                    break;
                case "i100":
                    this.bidstage.price1.priceInputTxt.text = String((this.lowestValue + 100));
                    break;
                case "priceBut":
                    if ((((this.bidcode == 3)) || ((this.bidcode == 4))))
                    {
                        _local_2 = new WarnInfoPart(7);
                        BidInitView.setWin(_local_2);
                    }
                    else
                    {
                        if (this.bidstage.price1.priceInputTxt.text.length == 0)
                        {
                            _local_2 = new WarnInfoPart(1);
                            BidInitView.setWin(_local_2);
                        }
                        else
                        {
                            if ((int(this.bidstage.price1.priceInputTxt.text) % 100) != 0)
                            {
                                _local_2 = new WarnInfoPart(2);
                                BidInitView.setWin(_local_2);
                            }
                            else
                            {
                                BidInitView.setWin(new PriceInfoWindowPart(int(this.bidstage.price1.priceInputTxt.text)));
                            };
                        };
                    };
                    break;
                case "priceBut2":
                    if ((((this.bidcode == 3)) || ((this.bidcode == 4))))
                    {
                        _local_2 = new WarnInfoPart(7);
                        BidInitView.setWin(_local_2);
                    }
                    else
                    {
                        if ((((this.bidstage.price2.priceInputTxt1.text.length == 0)) || ((this.bidstage.price2.priceInputTxt2.text.length == 0))))
                        {
                            _local_2 = new WarnInfoPart(1);
                            BidInitView.setWin(_local_2);
                        }
                        else
                        {
                            if (((!(((int(this.bidstage.price2.priceInputTxt1.text) % 100) == 0))) || (!(((int(this.bidstage.price2.priceInputTxt2.text) % 100) == 0)))))
                            {
                                _local_2 = new WarnInfoPart(2);
                                BidInitView.setWin(_local_2);
                            }
                            else
                            {
                                if (this.bidstage.price2.priceInputTxt1.text != this.bidstage.price2.priceInputTxt2.text)
                                {
                                    _local_2 = new WarnInfoPart(3);
                                    BidInitView.setWin(_local_2);
                                }
                                else
                                {
                                    BidInitView.setWin(new PriceInfoWindowPart(int(this.bidstage.price2.priceInputTxt1.text)));
                                };
                            };
                        };
                    };
                    break;
            };
        }

        public function setPriceInfo(val:String):void
        {
            this.bidstage.info.htmlText = (("<font color='#FF0000'>" + val) + "</font>");
        }


    }
}//package view
