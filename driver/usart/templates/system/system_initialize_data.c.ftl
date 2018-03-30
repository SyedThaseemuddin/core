// <editor-fold defaultstate="collapsed" desc="DRV_USART Instance ${INDEX?string} Initialization Data">

USART_PLIB_API drvUsart${INDEX?string}PlibAPI = {
        .readCallbackRegister = (USART_ReadCallbackRegister)${DRV_USART_PLIB}_ReadCallbackRegister,
        .read = (USART_Read)${DRV_USART_PLIB}_Read,
        .readIsBusy = (USART_ReadIsBusy)${DRV_USART_PLIB}_ReadIsBusy,
        .readCountGet = (USART_ReadCountGet)${DRV_USART_PLIB}_ReadCountGet,
        .writeCallbackRegister = (USART_WriteCallbackRegister)${DRV_USART_PLIB}_WriteCallbackRegister,
        .write = (USART_Write)${DRV_USART_PLIB}_Write,
        .writeIsBusy = (USART_WriteIsBusy)${DRV_USART_PLIB}_WriteIsBusy,
        .writeCountGet = (USART_WriteCountGet)${DRV_USART_PLIB}_WriteCountGet,
        .errorGet = (USART_ErrorGet)${DRV_USART_PLIB}_ErrorGet,
        .serialSetup = (USART_SerialSetup)${DRV_USART_PLIB}_SerialSetup
};

DRV_USART_INIT drvUsart${INDEX?string}InitData =
{
    .usartPlib = &drvUsart${INDEX?string}PlibAPI,

    .interruptUSART = ${DRV_USART_PLIB}_IRQn,

    .queueSizeTransmit = DRV_USART_XMIT_QUEUE_SIZE_IDX${INDEX?string},

    .queueSizeReceive = DRV_USART_RCV_QUEUE_SIZE_IDX${INDEX?string},

<#if DRV_USART_TX_DMA == true>
    .dmaChannelTransmit = DRV_USART_XMIT_DMA_CH_IDX${INDEX?string},

    .usartTransmitAddress = (void *)${DRV_USART_PLIB}_TRANSMIT_ADDRESS,
<#else>
    .dmaChannelTransmit = DMA_CHANNEL_NONE,
</#if>

<#if DRV_USART_RX_DMA == true>
    .dmaChannelReceive = DRV_USART_RCV_DMA_CH_IDX${INDEX?string},

    .usartReceiveAddress = (void *)${DRV_USART_PLIB}_RECEIVE_ADDRESS,
<#else>
    .dmaChannelReceive = DMA_CHANNEL_NONE,
</#if>

    .interruptDMA = XDMAC_IRQn,
};

// </editor-fold>